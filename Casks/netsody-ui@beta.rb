cask "netsody-ui@beta" do
  version "1.0.0-rc.1"

  on_arm do
    sha256 "deb1bddb6d630b85a512d6c4cf4334d5342a158dc4548a8967b87a97f76c1a3c"

    url "https://download.netsody.io/binaries/macos-arm64/1.0.0-rc.1/Netsody%20UI.zip"
  end
  on_intel do
    sha256 "b66c5e3a20f45285773fd224c2e1feb48c9d664d6fd319cb904475ac425e77c6"

    url "https://download.netsody.io/binaries/macos-amd64/1.0.0-rc.1/Netsody%20UI.zip"
  end

  name "netsody-ui"
  desc "Graphical interface for Netsody Zero Trust Network Access"
  homepage "https://netsody.io/"

  depends_on formula: "netsody"
  depends_on :macos

  app "Netsody UI.app"
end
