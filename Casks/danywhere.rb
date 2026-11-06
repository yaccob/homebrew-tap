cask "danywhere" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "9be4c8a15ac7177e146ed74e6e0df29a33cc8d96f94a3bddd6da8c0779c200cb",
         intel: "0d32633e44afea6c4c2956a7ad73e1754617437d9414b5ca331b84d5a4f74c59"

  url "https://github.com/yaccob/DanyWhere/releases/download/danywhere-v#{version}/DanyWhere_#{version}_#{arch}.dmg"
  name "DanyWhere"
  desc "Offline speech to text, a personal distribution of Handy"
  homepage "https://github.com/yaccob/DanyWhere"

  livecheck do
    url :url
    regex(/^danywhere[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "DanyWhere.app"

  zap trash: [
    "~/Library/Application Support/com.yaccob.danywhere",
    "~/Library/Caches/com.yaccob.danywhere",
    "~/Library/LaunchAgents/DanyWhere.plist",
    "~/Library/Logs/com.yaccob.danywhere",
    "~/Library/WebKit/com.yaccob.danywhere",
  ]
end
