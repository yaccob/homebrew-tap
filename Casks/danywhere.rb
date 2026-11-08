cask "danywhere" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "d6f9a5233146ce617e9ca3dc637cdabb8a7d5584f8dd32ede51052066b1caa2b",
         intel: "a28d14a3f391ca64527b9901898db119691e137038626e3fe79d1acb8647b55e"

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
