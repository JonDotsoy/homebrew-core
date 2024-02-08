class Envctl < Formula
  desc "Date format to console"
  homepage "https://github.com/jondotsoy/envctl/tree/develop#readme"
  url "https://api.github.com/repos/jondotsoy/envctl/tarball/4b56b74faa59dfa29a6b77f7d40f5205ca775dc0"
  sha256 "681b9e6a38be0388d9ac403851abea4fa29dfeea339b974df6b990e20cbb7b61"
  license "MIT"
  version "0.1.0-prev.20cbb7b61"

  depends_on "bun"
  depends_on "make"

  def install
    system "bun", "install"
    system "make", "build"
    bin.install "dist/envctl" => "envctl"
  end

  test do
    system "false"
  end
end
