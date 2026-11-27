cask "netsody-ui@beta" do
  version "1.0.0-rc.5"

  on_arm do
    sha256 "b95cf26c0652aee09d77d8ff91934f1ef1f4609d6e118f621c868050a7b25d77"

    url "https://download.netsody.io/binaries/macos-arm64/#{version}/Netsody%20UI.zip"
  end
  on_intel do
    sha256 "c87943723176c462b830caf7e2ffa214b23d93957664faef35f0a1ad438a0b13"

    url "https://download.netsody.io/binaries/macos-amd64/#{version}/Netsody%20UI.zip"
  end

  name "netsody-ui"
  desc "Graphical interface for Netsody Zero Trust Network Access"
  homepage "https://netsody.io/"

  depends_on formula: "netsody"
  depends_on :macos

  app "Netsody UI.app"
end
