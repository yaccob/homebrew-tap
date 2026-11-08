cask "bethli-gui" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "a7dd422beeecebc210830a7a1c60ec3fbb36b8f31e75e78b925e06c2c49ed730",
         intel: "663f9983698e33edb97bc2563c80226fe5bad0667d08e0587e559d8dbae7a88f"

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
