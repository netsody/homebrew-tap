require "securerandom"
require "etc"

class Netsody < Formula
  desc "Netsody provides secure, software-defined overlay networks, connecting all your devices"
  homepage "https://netsody.io"
  version "0.1.0"

  conflicts_with cask: "drasyl-ui"
  conflicts_with formula: "drasyl"

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
      
      # Create configuration and log directories
      (etc/"netsody").mkpath
      (var/"log").mkpath
  end

  def post_install
    token_file = etc/"netsody/auth.token"

    # Generate a random auth token if it doesn't already exist
    unless token_file.exist?
      token_file.write(SecureRandom.hex(24))
      chmod 0600, token_file
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
  end
end
