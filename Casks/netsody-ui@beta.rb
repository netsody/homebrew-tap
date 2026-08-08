cask "netsody-ui@beta" do
  version "1.0.0-rc.3"

  on_arm do
    sha256 "7d0a5e0bfb13e49b918626eb31ab785f0e5fa94755467403cfbfe2b34a751421"

    url "https://download.netsody.io/binaries/macos-arm64/#{version}/Netsody%20UI.zip"
  end
  on_intel do
    sha256 "12fb308261ef89bee83f453b8a786e3ae4ccd5239f9ea4e58916c661d2a3a963"

    url "https://download.netsody.io/binaries/macos-amd64/#{version}/Netsody%20UI.zip"
  end

  name "netsody-ui"
  desc "Graphical interface for Netsody Zero Trust Network Access"
  homepage "https://netsody.io/"

  depends_on formula: "netsody"
  depends_on :macos

  app "Netsody UI.app"
end
