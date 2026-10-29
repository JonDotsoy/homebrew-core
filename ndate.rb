class Ndate < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate#readme"
  url "https://github.com/JonDotsoy/ndate/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "a787f99a5a2d87248b102c8a185e9ebcc201ed082740390d558217664e4f37e5"
  license "MIT"

  depends_on "deno"

  # Self-contained bundle published as an asset of each ndate release.
  # TODO: bump url/sha256 together with the main url once a release that
  # ships ndate.js exists (sha256 of the released ndate.js).
  resource "ndate.js" do
    url "https://github.com/JonDotsoy/ndate/releases/download/v0.5.3/ndate.js"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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
