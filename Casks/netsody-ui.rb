cask "netsody-ui" do
  desc "Netsody UI - A graphical user interface for Netsody"
  homepage "https://netsody.io"
  version "latest"
  sha256 :no_check

  if Hardware::CPU.intel?
    url "https://download.netsody.io/binaries/0.1.0/macos-amd64/Netsody%20UI.zip"
  else
    url "https://download.netsody.io/binaries/0.1.0/macos-arm64/Netsody%20UI.zip"
  end

  name "netsody-ui"
  app "Netsody UI.app"

  depends_on formula: "netsody"
end 