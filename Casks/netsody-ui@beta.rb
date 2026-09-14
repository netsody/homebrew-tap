cask "netsody-ui@beta" do
  version "1.0.0-rc.4"

  on_arm do
    sha256 "3603186d12acceced78df097217bf9b63f66490496ba59c913d3a0515f2aea17"

    url "https://download.netsody.io/binaries/macos-arm64/#{version}/Netsody%20UI.zip"
  end
  on_intel do
    sha256 "7602205699dedef15b73bab9fa303dc570baf067baecbcc2a4388ac542d63e00"

    url "https://download.netsody.io/binaries/macos-amd64/#{version}/Netsody%20UI.zip"
  end

  name "netsody-ui"
  desc "Graphical interface for Netsody Zero Trust Network Access"
  homepage "https://netsody.io/"

  depends_on formula: "netsody"
  depends_on :macos

  app "Netsody UI.app"
end
