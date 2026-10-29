class Ndate < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate#readme"
  url "https://github.com/JonDotsoy/ndate/archive/refs/tags/v0.5.4.tar.gz"
  sha256 "c18117ecbac71721bbbdcdeec010fe49a1324d5f2b85a52bb8470452d123c23a"
  license "MIT"

  depends_on "deno"

  # Self-contained bundle published as an asset of each ndate release.
  resource "ndate.js" do
    url "https://github.com/JonDotsoy/ndate/releases/download/v0.5.4/ndate.js"
    sha256 "e6aaffe2a3f9313905478a6905dc92ac8b2e8578af73ed806a1648511b6a085b"
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
