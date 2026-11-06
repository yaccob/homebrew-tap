cask "bethli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.4.1"
  sha256 arm:   "ab310882692f086575f2a71b2a95f5b20cf9940509883a0f94e584140a77b513",
         intel: "270c608a8a9dd86581c6dbc26368f8b2370ec41728cc88da3d3cafa5596bfbbf"

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
