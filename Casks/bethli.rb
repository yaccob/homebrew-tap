cask "bethli" do
  version "0.2.1"
  sha256 "42040269805b68f07abb1bd93764c36f5833c543d02dd8e313a63728e8289513"

  url "https://github.com/yaccob/bethli-gui/releases/download/v#{version}/BeThLi_#{version}_aarch64.dmg"
  name "BeThLi"
  desc "Hide files in images and reveal them again"
  homepage "https://github.com/yaccob/bethli-gui"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "BeThLi.app"

  zap trash: [
    "~/Library/Application Support/bethli",
    "~/Library/Preferences/com.yaccob.bethli.plist",
    "~/Library/Saved Application State/com.yaccob.bethli.savedState",
  ]
end
