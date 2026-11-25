require "etc"

class Netsody < Formula
  desc "Zero Trust Network Access for users, devices, services, and private networks"
  homepage "https://netsody.io"

  conflicts_with "drasyl/tap/drasyl", because: "both install conflicting TUN devices"
  conflicts_with "netsody/tap/netsody-beta", because: "both install `netsody` binaries"

  # Dynamically determine architecture and set appropriate URL
  if Hardware::CPU.arm?
    url "https://download.netsody.io/binaries/0.1.0/macos-arm64/netsody"
  else
    url "https://download.netsody.io/binaries/0.1.0/macos-amd64/netsody"
  end

  service do
    run [opt_bin/"netsody", "run"]
    keep_alive true
    require_root true
    working_dir etc/"netsody"
    log_path var/"log/netsody.out.log"
    error_log_path var/"log/netsody.err.log"
    environment_variables RUST_LOG: "info"
    environment_variables RUST_BACKTRACE: "full"
  end

  def install
    # Install the pre-built binary for stable releases
    bin.install "netsody"

    # Package the token generator so the declarative post-install step can run it.
    libexec.mkpath
    (libexec/"generate-auth-token").write <<~SH
      #!/bin/sh
      set -eu

      token_file=$1
      [ ! -e "$token_file" ] || exit 0

      umask 077
      random_hex=$(od -An -N24 -tx1 /dev/urandom | tr -d ' \\n')
      [ "${#random_hex}" -eq 48 ]
      printf %s "$random_hex" > "$token_file"
      chmod 0600 "$token_file"
    SH
    chmod 0755, libexec/"generate-auth-token"

    # Create configuration and log directories
    (etc/"netsody").mkpath
    (var/"log").mkpath
  end

  post_install_steps do
    unless_path_exists "netsody/auth.token", base: :etc do
      run "generate-auth-token", args: ["{{etc}}/netsody/auth.token"], base: :libexec
    end
  end

  def caveats
    <<~EOS
      An API auth token has been created at:
        #{etc}/netsody/auth.token

      To use Netsody you must copy it into your home directory:
        mkdir -p ~/.netsody
        cp #{etc}/netsody/auth.token ~/.netsody/auth.token
        chmod 600 ~/.netsody/auth.token
    EOS
  end

  test do
    # Check that the netsody version command executes successfully
    system "#{bin}/netsody", "version"

    token_file = etc/"netsody/auth.token"
    assert_predicate token_file, :exist?
    assert_match(/\A[0-9a-f]{48}\z/, token_file.read)
    assert_equal 0600, token_file.stat.mode & 0777
  end
end
