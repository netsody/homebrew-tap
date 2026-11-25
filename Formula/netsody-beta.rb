class NetsodyBeta < Formula
  desc "Zero Trust Network Access for users, devices, services, and private networks"
  homepage "https://netsody.io"
  version "1.0.0-rc.5"

  on_macos do
    on_arm do
      url "https://download.netsody.io/binaries/macos-arm64/1.0.0-rc.5/netsody"
      sha256 "528a9c6db567d21922703234f46be5a090d0379438c93b2229ea532170a121c3"
    end

    on_intel do
      url "https://download.netsody.io/binaries/macos-amd64/1.0.0-rc.5/netsody"
      sha256 "565e728bf85b24961ac8da43c689a864fb3ccca72e8aa7a45c95f0f6fe4a7017"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-amd64/1.0.0-rc.5/netsody"
        sha256 "9f8cd31267b13711545b19dc50fd31fb607bbefbf7f0ed5eb77eeca235d72fd3"
      end
    end

    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-arm64/1.0.0-rc.5/netsody"
        sha256 "2a0d2184c27b85132772a0ca01e77b279368a5e76670442451ab13f53188a674"
      else
        url "https://download.netsody.io/binaries/linux-armv7/1.0.0-rc.5/netsody"
        sha256 "8110ac85f4fbd8188611c9d0814651fc1c7bb7d92f092f38010204312643095c"
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
