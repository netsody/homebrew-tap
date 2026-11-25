cask "netsody-ui@beta" do
  version "1.0.0-rc.5"

  on_arm do
    sha256 "ecded4a34e9b1ef0d35a968c83e26a1fd8e85eba4344b634a00dca237d3907e1"

    url "https://download.netsody.io/binaries/macos-arm64/#{version}/Netsody%20UI.zip"
  end
  on_intel do
    sha256 "5b292cb99d970079a7987a3e4fbb0227d3b11c2fbe82f72fe33d39da806b51c1"

    url "https://download.netsody.io/binaries/macos-amd64/#{version}/Netsody%20UI.zip"
  end

  name "netsody-ui"
  desc "Graphical interface for Netsody Zero Trust Network Access"
  homepage "https://netsody.io/"

  depends_on formula: "netsody"
  depends_on :macos

  app "Netsody UI.app"
end
