class NetsodyBeta < Formula
  desc "Zero Trust Network Access for users, devices, services, and private networks"
  homepage "https://netsody.io"
  version "1.0.0-rc.5"

  on_macos do
    on_arm do
      url "https://download.netsody.io/binaries/macos-arm64/1.0.0-rc.5/netsody"
      sha256 "52a34f8042b697733aeb45a5f4ec4f7e65573139561c555e4c2b496671a3b943"
    end

    on_intel do
      url "https://download.netsody.io/binaries/macos-amd64/1.0.0-rc.5/netsody"
      sha256 "16bd70691ecb4c693b17ee091a30f67da465bfa31b8048ef6ec2cd5f2a687c23"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-amd64/1.0.0-rc.5/netsody"
        sha256 "5c8fe5edb2f10e78b03f105827ef433263628158dda535efaa56c4d79f326b6d"
      end
    end

    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-arm64/1.0.0-rc.5/netsody"
        sha256 "37b950e7dc07a2411eb3528e28b1b68d549c2827e3b2d869ddea0754e5817b5d"
      else
        url "https://download.netsody.io/binaries/linux-armv7/1.0.0-rc.5/netsody"
        sha256 "2db3732df38b57b1976387a1d96fe9ac19c3128b1cafe9305af578471354df76"
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
