class Ndate < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate#readme"
  url "https://github.com/JonDotsoy/ndate/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "a787f99a5a2d87248b102c8a185e9ebcc201ed082740390d558217664e4f37e5"
  license "MIT"

  depends_on "deno"

  def install
    system "deno", "compile", "--allow-env=TZ,LANG", "--output", "ndate", "ndate.ts"
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
