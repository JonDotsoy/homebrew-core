class Ndate < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate#readme"
  url "https://github.com/JonDotsoy/ndate/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "04fa2194cb0f82554a5b7658f2bc9bf986560572240f3e4ffa529c8e00aa79ee"
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
