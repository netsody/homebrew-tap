cask "netsody-ui@beta" do
  version "1.0.0-rc.5"

  on_arm do
    sha256 "0335bbb1d8e493ac8b8f27a7bc9534d37deef516e3bc3ff795870b979d91bbea"

    url "https://download.netsody.io/binaries/macos-arm64/#{version}/Netsody%20UI.zip"
  end
  on_intel do
    sha256 "cd089d74691df3669c99129136ce909dbeb115bf940c06193d41366c93a9583f"

    url "https://download.netsody.io/binaries/macos-amd64/#{version}/Netsody%20UI.zip"
  end

  name "netsody-ui"
  desc "Graphical interface for Netsody Zero Trust Network Access"
  homepage "https://netsody.io/"

  depends_on formula: "netsody"
  depends_on :macos

  app "Netsody UI.app"
end
