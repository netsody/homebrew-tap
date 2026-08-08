class NetsodyBeta < Formula
  desc "Zero Trust Network Access for users, devices, services, and private networks"
  homepage "https://netsody.io"
  version "1.0.0-rc.3"

  on_macos do
    on_arm do
      url "https://download.netsody.io/binaries/macos-arm64/1.0.0-rc.3/netsody"
      sha256 "fb2229aab961a7cf43706705a771945cd9a26063d3e732f1a0691945a5b8be01"
    end

    on_intel do
      url "https://download.netsody.io/binaries/macos-amd64/1.0.0-rc.3/netsody"
      sha256 "32bf42afef96cc8bae73cb5435a14ad3b6bff953515c3e1950d77c1ac2b67a4c"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-amd64/1.0.0-rc.3/netsody"
        sha256 "cd5f064b995ae39792a8ce509769c55c711ea6e72e0850e58352a41dbb4da608"
      end
    end

    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-arm64/1.0.0-rc.3/netsody"
        sha256 "328914ee7bbc8398816d54b77363064daced80fb72981e3a0c7786b2a4baf132"
      else
        url "https://download.netsody.io/binaries/linux-armv7/1.0.0-rc.3/netsody"
        sha256 "6dee9af3026f134ac9cfb8ce5b113027742e794bd41ccdf5dbd7b9d3fecd0eae"
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
