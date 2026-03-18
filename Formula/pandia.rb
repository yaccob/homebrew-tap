class Pandia < Formula
  desc "Markdown to PDF/HTML with PlantUML, Graphviz, Mermaid, Ditaa, TikZ and LaTeX math"
  homepage "https://github.com/yaccob/pandia"
  url "https://github.com/yaccob/pandia/archive/refs/tags/v1.1.0.tar.gz"
  version "1.1.0"
  license "MIT"

  depends_on "pandoc"
  depends_on "plantuml"
  depends_on "graphviz"
  depends_on "mermaid-cli"
  depends_on "librsvg"
  depends_on "basictex" => :optional

  def install
    (share/"pandia").install "diagram-filter.lua"
    bin.install "bin/pandia"
  end

  def caveats
    <<~EOS
      pandia requires a LaTeX distribution for PDF output.
      If you don't have one, install BasicTeX:
        brew install --cask basictex
    EOS
  end

  test do
    (testpath/"test.md").write("# Hello\n\n$$E=mc^2$$\n")
    system bin/"pandia", "--html", "test.md"
    assert_predicate testpath/"test.html", :exist?
  end
end
