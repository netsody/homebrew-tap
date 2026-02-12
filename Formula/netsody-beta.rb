class NetsodyBeta < Formula
  desc "Netsody provides secure, software-defined overlay networks, connecting all your devices"
  homepage "https://netsody.io"
  version "1.0.0-beta.6"

  conflicts_with cask: "drasyl-ui"
  conflicts_with formula: ["drasyl", "netsody"]

  on_macos do
    on_arm do
      url "https://download.netsody.io/binaries/macos-arm64/1.0.0-beta.6/netsody"
    end

    on_intel do
      url "https://download.netsody.io/binaries/macos-amd64/1.0.0-beta.6/netsody"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-amd64/1.0.0-beta.6/netsody"
      end
    end

    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-arm64/1.0.0-beta.6/netsody"
      else
        url "https://download.netsody.io/binaries/linux-armv7/1.0.0-beta.6/netsody"
      end
    end
  end

  def install
    mv Dir["*"].first, "netsody"
    bin.install "netsody"
  end

  test do
    # Check that the netsody version command executes successfully
    system "#{bin}/netsody", "version"
  end
end
