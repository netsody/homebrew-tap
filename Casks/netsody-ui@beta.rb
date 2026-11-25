cask "netsody-ui@beta" do
  version "1.0.0-rc.5"

  on_arm do
    sha256 "17301069c0d1242fdcfe6f4e68d383022852400bf04a887ce2c82edd6675025c"

    url "https://download.netsody.io/binaries/macos-arm64/#{version}/Netsody%20UI.zip"
  end
  on_intel do
    sha256 "f63d6c25c1460b77ffb9dc17392e2bc43d846e4e830549817285010183e8dfcd"

    url "https://download.netsody.io/binaries/macos-amd64/#{version}/Netsody%20UI.zip"
  end

  name "netsody-ui"
  desc "Graphical interface for Netsody Zero Trust Network Access"
  homepage "https://netsody.io/"

  depends_on formula: "netsody"
  depends_on :macos

  app "Netsody UI.app"
end
