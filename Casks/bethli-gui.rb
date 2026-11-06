cask "bethli-gui" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "492e6d2629dc6a71a31defc4114497d8a349786a36cf5e82d7feba5e228fca83",
         intel: "8d1694364fa35bbf76f8bfa4b5eafc4c10bfc8dff3320dd90cbf7e8ee5da709c"

  url "https://github.com/yaccob/bethli/releases/download/gui-v#{version}/BeThLi_#{version}_#{arch}.dmg"
  name "BeThLi"
  desc "Hide files in images and reveal them again (desktop app)"
  homepage "https://github.com/yaccob/bethli"

  # The releases of the app and the command line share one repository; the
  # app's tags start with gui-v.
  livecheck do
    url :url
    regex(/^gui-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on :macos

  app "BeThLi.app"

  zap trash: [
    "~/Library/Application Support/bethli",
    "~/Library/Preferences/com.yaccob.bethli.plist",
    "~/Library/Saved Application State/com.yaccob.bethli.savedState",
  ]
end
