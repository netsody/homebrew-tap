cask "netsody-ui@beta" do
  version "1.0.0-beta.9"
  sha256 :no_check

  on_arm do
    url "https://download.netsody.io/binaries/macos-arm64/1.0.0-beta.9/Netsody%20UI.zip"
  end
  on_intel do
    url "https://download.netsody.io/binaries/macos-amd64/1.0.0-beta.9/Netsody%20UI.zip"
  end

  name "netsody-ui"
  desc "Graphical interface for Netsody Zero Trust Network Access"
  homepage "https://netsody.io/"

  depends_on formula: "netsody"

  app "Netsody UI.app"
end
