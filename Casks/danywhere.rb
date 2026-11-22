cask "danywhere" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "e1f3858346ba13b4141af8bc46dfacbb27b7ae1f2663d53df1af4b46f7a658a9",
         intel: "4ad465a06b9d2fdfefc143a6fa9d79134524d447489bc1d3e2e31104f9c5edcc"

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
