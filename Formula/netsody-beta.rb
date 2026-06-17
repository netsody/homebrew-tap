class NetsodyBeta < Formula
  desc "Zero Trust Network Access for users, devices, services, and private networks"
  homepage "https://netsody.io"
  version "1.0.0-rc.1"

  on_macos do
    on_arm do
      url "https://download.netsody.io/binaries/macos-arm64/1.0.0-rc.1/netsody"
      sha256 "08bb320eb2b50815028e09e9583f933798ca72b98b821aa260f8cc5f10debfdd"
    end

    on_intel do
      url "https://download.netsody.io/binaries/macos-amd64/1.0.0-rc.1/netsody"
      sha256 "c49aa8471f4b156bd5c715e597a632a6a2c7a86e22a3e24843e58d371f0fab4d"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-amd64/1.0.0-rc.1/netsody"
        sha256 "cb8e77be4ba130fee330c3aabce43ecaa89d2c9b30c81b6f3f255e551115e717"
      end
    end

    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://download.netsody.io/binaries/linux-arm64/1.0.0-rc.1/netsody"
        sha256 "8acc62757e7915ca423e30ee6ba879d6f2195a3b7e7a1f05117743d3cf67a87f"
      else
        url "https://download.netsody.io/binaries/linux-armv7/1.0.0-rc.1/netsody"
        sha256 "d808fd45231c0693e4bf24231ed491a086fa2b622adfdc38727c068b8875e899"
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
