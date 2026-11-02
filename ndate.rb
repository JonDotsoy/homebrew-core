class Ndate < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate#readme"
  url "https://github.com/JonDotsoy/ndate/archive/refs/tags/v0.5.8.tar.gz"
  sha256 "88d893372a4cf04dc34636fe4ebba4a401e6538e5e587ab69dd954f3caaf8c47"
  license "MIT"

  depends_on "deno"

  # Self-contained bundle published as an asset of each ndate release.
  resource "ndate.js" do
    url "https://github.com/JonDotsoy/ndate/releases/download/v0.5.8/ndate.js"
    sha256 "5712dd96c1895df356e23b09fa21f62a4ea48632bd1a9286e04829df04ebbb2b"
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
