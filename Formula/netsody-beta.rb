class NetsodyBeta < Formula
  desc "Zero Trust Network Access for users, devices, services, and private networks"
  homepage "https://netsody.io"
  version "1.0.0-rc.5"

  on_macos do
    on_arm do
      url "https://download.netsody.io/binaries/macos-arm64/1.0.0-rc.5/netsody"
      sha256 "5d95c8994445fda352852d105a04d25a08346c3107b49c614f18ebac9d57cbf6"
    end

    on_intel do
      url "https://download.netsody.io/binaries/macos-amd64/1.0.0-rc.5/netsody"
      sha256 "0afd88b06935e3d8ad1884f9e81a2291c22dc594a9d316a257f546503a2b6d5a"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-amd64/1.0.0-rc.5/netsody"
        sha256 "5e2e6631548e9174981e6f867e6c668510621fe28db4d2b3c0adba704bc8abdb"
      end
    end

    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-arm64/1.0.0-rc.5/netsody"
        sha256 "f8574e0e1e348ab44346d4d75cf3949091331b9bfaf47982cd68500bfa5125ec"
      else
        url "https://download.netsody.io/binaries/linux-armv7/1.0.0-rc.5/netsody"
        sha256 "99604f2b6e32fe03d74493d5b2b345378f56e3fcc78c5458674f9a7e14facf7e"
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
