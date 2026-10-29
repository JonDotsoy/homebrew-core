class Ndate < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate#readme"
  url "https://github.com/JonDotsoy/ndate/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "960cbed185ca5c73c2f5096fce27c91a4f29049edd07779f3fe21fff3ceb7c30"
  license "MIT"

  depends_on "deno"

  def install
    system "deno", "compile", "--allow-env=TZ,LANG", "--output", "ndate", "ndate.ts"
    bin.install "ndate"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/ndate --version")
  end
end
