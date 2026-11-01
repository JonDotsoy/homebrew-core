class Ndate < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate#readme"
  url "https://github.com/JonDotsoy/ndate/archive/refs/tags/v0.5.5.tar.gz"
  sha256 "58c5da71af4e270dd63b08e1c53650cedb76644d69f3aa7a9d1a59d018515d30"
  license "MIT"

  depends_on "deno"

  # Self-contained bundle published as an asset of each ndate release.
  resource "ndate.js" do
    url "https://github.com/JonDotsoy/ndate/releases/download/v0.5.5/ndate.js"
    sha256 "e4513230db7a29ec0ac13063f354743267244b5ef6857a99971f0bc583aef0da"
  end

  def install
    resource("ndate.js").stage buildpath
    system "deno", "compile", "--allow-env=TZ,LANG", "--output", "ndate", "ndate.js"
    bin.install "ndate"
    bash_completion.install "completions/ndate.bash" => "ndate"
    zsh_completion.install "completions/ndate.zsh" => "_ndate"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/ndate --version")
    assert_path_exists bash_completion/"ndate"
    assert_path_exists zsh_completion/"_ndate"
  end
end
