cask "bethli-gui" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "42040269805b68f07abb1bd93764c36f5833c543d02dd8e313a63728e8289513",
         intel: "ca88e23e620852e7ac9212a24e930e9b5f0d389cf2dca0dcabac7fdc739f6c48"

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
