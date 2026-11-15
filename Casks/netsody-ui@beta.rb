cask "netsody-ui@beta" do
  version "1.0.0-rc.5"

  on_arm do
    sha256 "8cbecc663cd3d30d6cadbabfe73d0a358fbad3ab5f0d45ca19588a31cfef600f"

    url "https://download.netsody.io/binaries/macos-arm64/#{version}/Netsody%20UI.zip"
  end
  on_intel do
    sha256 "d6e2a9b55d60130e0cab1aee1590a04e63c52d5e97850fb4f02884016e062194"

    url "https://download.netsody.io/binaries/macos-amd64/#{version}/Netsody%20UI.zip"
  end

  name "netsody-ui"
  desc "Graphical interface for Netsody Zero Trust Network Access"
  homepage "https://netsody.io/"

  depends_on formula: "netsody"
  depends_on :macos

  app "Netsody UI.app"
end
