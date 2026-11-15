cask "danywhere" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "0c1846133dd19942a74f2d396cd6d5311a956fae400b791f322cf966d9e9ca20",
         intel: "a089a233daf498ecba97ea46786000dfa5ce064c3fa7085ead48dc73ce342b52"

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
