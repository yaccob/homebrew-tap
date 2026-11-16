cask "bethli-gui" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.0"
  sha256 arm:   "a1317bb43c891894f1bbcdfe453bb25e8fc20f21caa10220ad9aa3f7241f8da2",
         intel: "a27165946632834cbe1963b2752b4369f41e2e432daeb6ce7c5081c92d6d8754"

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
