cask "netsody-ui@beta" do
  version "1.0.0-rc.2"

  on_arm do
    sha256 "21fe81cbf0d6646c059bbfe41bdd73320775f42b9aa4a7488314695834989dc8"

    url "https://download.netsody.io/binaries/macos-arm64/1.0.0-rc.2/Netsody%20UI.zip"
  end
  on_intel do
    sha256 "1a5d2039ee2965896d58faedfb619a963d43a4dfc25d79d33bd8b1dc1d70b29a"

    url "https://download.netsody.io/binaries/macos-amd64/1.0.0-rc.2/Netsody%20UI.zip"
  end

  name "netsody-ui"
  desc "Graphical interface for Netsody Zero Trust Network Access"
  homepage "https://netsody.io/"

  depends_on formula: "netsody"
  depends_on :macos

  app "Netsody UI.app"
end
