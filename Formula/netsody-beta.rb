class NetsodyBeta < Formula
  desc "Zero Trust Network Access for users, devices, services, and private networks"
  homepage "https://netsody.io"
  version "1.0.0-rc.5"

  on_macos do
    on_arm do
      url "https://download.netsody.io/binaries/macos-arm64/1.0.0-rc.5/netsody"
      sha256 "fee36af9d1b15b996bb891539c02e7a451824b6b7c6a5ac1a5de5c885b7d53ff"
    end

    on_intel do
      url "https://download.netsody.io/binaries/macos-amd64/1.0.0-rc.5/netsody"
      sha256 "7c9bbaf47f7ab69737e8c7968a099165dbe3c51886e53ac713005d8039a42cb4"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-amd64/1.0.0-rc.5/netsody"
        sha256 "0797d8d5610c7f263f8ddbaedc70d3d98e0fa43fff34002d77f69b5233e5e123"
      end
    end

    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-arm64/1.0.0-rc.5/netsody"
        sha256 "c576c2b658c2eea5aba9c4e2b4c1ff0beacefd1776382b93feeef2653bc3ddf2"
      else
        url "https://download.netsody.io/binaries/linux-armv7/1.0.0-rc.5/netsody"
        sha256 "ef88b22aac3ef5cc6654165a31f635d4d761ba08926144b1f82f543cde87a8d2"
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
