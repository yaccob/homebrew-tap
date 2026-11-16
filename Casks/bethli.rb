cask "bethli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.0"
  sha256 arm:   "e231c9561003d12580c4983c1c9e3803fdc8ada6cb284172a9c925e39658512b",
         intel: "28a9e1d3435b33586ac6d622f3744638e8e36afed2369f81784b25d7c0ceef5a"

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
end
