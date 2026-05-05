cask "netsody-ui@beta" do
  desc "Netsody UI - A graphical user interface for Netsody"
  homepage "https://netsody.io"
  version "1.0.0-beta.9"
  sha256 :no_check

  if Hardware::CPU.intel?
    url "https://download.netsody.io/binaries/macos-amd64/1.0.0-beta.9/Netsody%20UI.zip"
  else
    url "https://download.netsody.io/binaries/macos-arm64/1.0.0-beta.9/Netsody%20UI.zip"
  end

  name "netsody-ui"
  app "Netsody UI.app"

  depends_on formula: "netsody"
end
