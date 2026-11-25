class NetsodyBeta < Formula
  desc "Zero Trust Network Access for users, devices, services, and private networks"
  homepage "https://netsody.io"
  version "1.0.0-rc.4"

  on_macos do
    on_arm do
      url "https://download.netsody.io/binaries/macos-arm64/1.0.0-rc.4/netsody"
      sha256 "cef8516180eb2b00698ad1053de747eec10099e0900ad505eed13b13bc925ebd"
    end

    on_intel do
      url "https://download.netsody.io/binaries/macos-amd64/1.0.0-rc.4/netsody"
      sha256 "61c29136e3bda9c10379738a76a011666df2d3930f798a286442aec5585908a8"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-amd64/1.0.0-rc.4/netsody"
        sha256 "dfe4edc9e09d7ac728d3208749aa2ebc6080f6fcae9d867dc1ea08292b98a1ed"
      end
    end

    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-arm64/1.0.0-rc.4/netsody"
        sha256 "2299ee175703052fcc777426d198bb82c4ff3e9b189b12c0d186f9a0e928fee6"
      else
        url "https://download.netsody.io/binaries/linux-armv7/1.0.0-rc.4/netsody"
        sha256 "f537714d3ac56e0e2a915080123cdbacd6e28801c79822c2bf107919d21c5529"
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
