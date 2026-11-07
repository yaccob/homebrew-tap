cask "bethli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "f17ef0fe32bc0e1848d3a8a3a03507fbab9aa270234abb8f05d15090cb9dcc13",
         intel: "0c56df1f4b5200bbe38eef31c18cc5d1222eb19a3ac2bfa46a8341acb309d910"

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
