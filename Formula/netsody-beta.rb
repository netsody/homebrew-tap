class NetsodyBeta < Formula
  desc "Zero Trust Network Access for users, devices, services, and private networks"
  homepage "https://netsody.io"
  version "1.0.0-rc.5"

  on_macos do
    on_arm do
      url "https://download.netsody.io/binaries/macos-arm64/1.0.0-rc.5/netsody"
      sha256 "03490936cd5bbfbd221439e61e1a7c84b3a39be2451c79ee07904ba5328a35de"
    end

    on_intel do
      url "https://download.netsody.io/binaries/macos-amd64/1.0.0-rc.5/netsody"
      sha256 "d515e9e6fc4c850f7180313c4b0745c68846a5e2a57544f857b8243ee873c572"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-amd64/1.0.0-rc.5/netsody"
        sha256 "7576d656362963bab494523d973cb6a7fe23d58ece6a805c8d8cf0d9216a87b2"
      end
    end

    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-arm64/1.0.0-rc.5/netsody"
        sha256 "39129fa34e8eeb28518a10e16b4636fc1e86e2d357762cc66a8d18cb6cda859e"
      else
        url "https://download.netsody.io/binaries/linux-armv7/1.0.0-rc.5/netsody"
        sha256 "d294f17efa67a6bb0e8543ff9ebd3aaf7c1281af7d2ed4dde73a0bace3e0589c"
      end
    end
  end

  conflicts_with "drasyl/tap/drasyl", because: "both install conflicting TUN devices"
  conflicts_with "netsody/tap/netsody", because: "both install `netsody` binaries"

  def install
    mv Dir["*"].first, "netsody"
    bin.install "netsody"
  end

  test do
    # Check that the netsody version command executes successfully
    system "#{bin}/netsody", "version"
  end
end
