cask "danywhere" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.4"
  sha256 arm:   "36f08a1dc650fb8a89294d42cecd0887e0cfa586742cc2422b0bdb00a595f8e8",
         intel: "5a68d610c86398cd03cd5ad6b49a3af3fc404e023d7d0b3046d4de031e9bb277"

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
