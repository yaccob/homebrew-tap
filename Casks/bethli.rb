cask "bethli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.0"
  sha256 arm:   "a9d10aac1344918a84c3d5c224e0e205a65fe20151354947ca24788a68f62162",
         intel: "f0eb838eab283458c62cb9a4d2179d0f3e351d1cd0c55d34ec6428c4643c93a1"

  url "https://github.com/yaccob/bethli/releases/download/cli-v#{version}/bethli-cli_#{version}_#{arch}-apple-darwin.tar.gz"
  name "BeThLi command line"
  desc "Hide files in images and reveal them again (command-line tool)"
  homepage "https://github.com/yaccob/bethli"

  # The releases of the app and the command line share one repository; the
  # command line's tags start with cli-v.
  livecheck do
    url :url
    regex(/^cli-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on :macos

  binary "bethli-cli_#{version}_#{arch}-apple-darwin/bethli"

  caveats <<~EOS
    This cask is the command line of BeThLi. Until 2026-11-06 it was the
    desktop app, which is now the cask bethli-gui:
      brew install --cask yaccob/tap/bethli-gui
  EOS
end
