class Ndate < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate/tree/morgan-v0.4.1#readme"
  url "https://api.github.com/repos/JonDotsoy/ndate/tarball/morgan-v0.4.3"
  sha256 "525b5ada2fab07534bd5e8affe00b1da71c8f053dc07290ee6ca30f1d6e45e53"
  license "MIT"

  depends_on "deno"

  def install
    system "deno", "compile", "--allow-env=TZ,LANG", "ndate.ts"
    bin.install "ndate" => "ndate"
  end

  test do
    system "false"
  end
end
