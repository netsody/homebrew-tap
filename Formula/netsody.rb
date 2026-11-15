require "etc"

class Netsody < Formula
  desc "Zero Trust Network Access for users, devices, services, and private networks"
  homepage "https://netsody.io"

  # Dynamically determine operating system, architecture and matching artifact URL
  on_macos do
    on_arm do
      url "https://download.netsody.io/binaries/macos-arm64/0.1.0/netsody"
      sha256 "ed72daf8dd386f5c24cc3b71c66515f8e8cda175c9bf2af177a02d9ec632346e"
    end
    on_intel do
      url "https://download.netsody.io/binaries/macos-amd64/0.1.0/netsody"
      sha256 "6d5f10ef68b20206c171ce07e17a2b6cb09a7ab9da27607192b31af4a0c927bf"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-amd64/0.1.0/netsody"
        sha256 "51d7b7e676bf6e8a23d3f7e32bcb34c4eeac3ed4599a897fbbfde332fd2ac368"
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-arm64/0.1.0/netsody"
        sha256 "a439743e6f4b0870645bd2dc83c2ed560726da777a6bfc3d45072c7b1808dacf"
      end
    end
  end

  conflicts_with "drasyl/tap/drasyl", because: "both install conflicting TUN devices"
  conflicts_with "netsody/tap/netsody-beta", because: "both install `netsody` binaries"

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

    # Create configuration and log directories
    (etc/"netsody").mkpath
    (var/"log").mkpath
  end

  post_install_steps do
    unless_path_exists "{{etc}}/netsody/auth.token" do
      run("openssl", args: ["rand", "-hex", "48"], stdout_path: "{{etc}}/netsody/auth.token")
    end
    set_permissions "{{etc}}/netsody/auth.token", "0600"
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
  end
end
