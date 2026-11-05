class Ndate < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate#readme"
  url "https://github.com/JonDotsoy/ndate/archive/refs/tags/v0.5.9.tar.gz"
  sha256 "073114ca121e2116789b163073f87c9bccc3b9cbaa8fd10fd980e38f8e6e5500"
  license "MIT"

  depends_on "deno"

  # Self-contained bundle published as an asset of each ndate release.
  resource "ndate.js" do
    url "https://github.com/JonDotsoy/ndate/releases/download/v0.5.9/ndate.js"
    sha256 "7bdafe7a40096cf25ba39a458eade9601b4bc4c50869dd56162dde44a4102841"
  end

  def install
    resource("ndate.js").stage buildpath
    system "deno", "compile", "--allow-env=TZ,LANG", "--output", "ndate", "ndate.js"
    bin.install "ndate"
    generate_completions_from_executable(bin/"ndate", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/ndate --version")
    assert_path_exists bash_completion/"ndate"
    assert_path_exists zsh_completion/"_ndate"
    assert_path_exists fish_completion/"ndate.fish"
  end
end
