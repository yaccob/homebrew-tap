cask "bethli-gui" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "da44c09d8c26e6b3d40d550f1f0d7c5b64a6f997c68cedf1b1dde54ff4868344",
         intel: "48403dc95380ea8f5ce14b786f2812933850a3739fa76e0fd1f69a1a05d8fc2a"

  url "https://github.com/yaccob/bethli/releases/download/gui-v#{version}/BeThLi_#{version}_#{arch}.dmg"
  name "BeThLi app"
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
