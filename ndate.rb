class Ndate < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate#readme"
  url "https://github.com/JonDotsoy/ndate/archive/refs/tags/v0.5.10.tar.gz"
  sha256 "196cb1db95759190907a3097ad89548095daaee7612aecee4cd0fbe2d63f1390"
  license "MIT"

  depends_on "deno"

  # Self-contained bundle published as an asset of each ndate release.
  resource "ndate.js" do
    url "https://github.com/JonDotsoy/ndate/releases/download/v0.5.10/ndate.js"
    sha256 "eef67aef7430596203cad56326cc87a8152dbdc2e65cdbed83c6024b58e11d6d"
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
