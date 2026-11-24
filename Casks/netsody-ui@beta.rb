cask "netsody-ui@beta" do
  version "1.0.0-rc.5"

  on_arm do
    sha256 "5ce548633c3e9927684229006d5c8ffe114e68325489da31c6bbdfbb5bd5d991"

    url "https://download.netsody.io/binaries/macos-arm64/#{version}/Netsody%20UI.zip"
  end
  on_intel do
    sha256 "c912384da9ebcba2d2c3b8d786c2f92b81949d8925d2d7f0cf09e90d1ca71ef6"

    url "https://download.netsody.io/binaries/macos-amd64/#{version}/Netsody%20UI.zip"
  end

  name "netsody-ui"
  desc "Graphical interface for Netsody Zero Trust Network Access"
  homepage "https://netsody.io/"

  depends_on formula: "netsody"
  depends_on :macos

  app "Netsody UI.app"
end
