cask "bethli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.7.0"
  sha256 arm:   "c62ddd31fe6176b732e0e3700e4094acd66eac67cf54f9eb4af75a4bc75c0d48",
         intel: "8caeec4bd62f1a9ac4b8e94cfc45dfffdc60832553c4b86fe4bade677febba6e"

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
