cask "netsody-ui" do
  version "0.1.0"
  sha256 :no_check

  on_arm do
    url "https://download.netsody.io/binaries/0.1.0/macos-arm64/Netsody%20UI.zip"
  end
  on_intel do
    url "https://download.netsody.io/binaries/0.1.0/macos-amd64/Netsody%20UI.zip"
  end

  name "netsody-ui"
  desc "Graphical interface for Netsody Zero Trust Network Access"
  homepage "https://netsody.io/"

  depends_on formula: "netsody"
  depends_on :macos

  app "Netsody UI.app"
end
