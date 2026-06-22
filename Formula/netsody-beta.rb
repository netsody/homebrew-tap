class NetsodyBeta < Formula
  desc "Zero Trust Network Access for users, devices, services, and private networks"
  homepage "https://netsody.io"
  version "1.0.0-rc.2"

  on_macos do
    on_arm do
      url "https://download.netsody.io/binaries/macos-arm64/1.0.0-rc.2/netsody"
      sha256 "019d1e3f51e5c9b3a75e3302de620b0572017dd5273d7cfa5317e8945fb2b572"
    end

    on_intel do
      url "https://download.netsody.io/binaries/macos-amd64/1.0.0-rc.2/netsody"
      sha256 "4780b7cc225bdfde75075043380f4c319858f7d9dfceb5191180248768c7a72e"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-amd64/1.0.0-rc.2/netsody"
        sha256 "418ac23a3631cae1da6141910d5bc76d1119ccd714fda596eec2ff6da26e0af1"
      end
    end

    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-arm64/1.0.0-rc.2/netsody"
        sha256 "151d9401ced105dbf78bfcdd6861ab8893e0b0ef1ed292856126d58b32a249a1"
      else
        url "https://download.netsody.io/binaries/linux-armv7/1.0.0-rc.2/netsody"
        sha256 "423d069e9b92132b18c6ca2cfb470c27a338a4b0305371c2dd1f85c26b544a36"
      end
    end
  end

  conflicts_with "drasyl/tap/drasyl", because: "both install `netsody` binaries"
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
