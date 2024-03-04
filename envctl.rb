class Envctl < Formula
  desc "Manager many environment files (.env.&lt;ctx&gt;) so easy."
  homepage "https://github.com/jondotsoy/envctl/tree/develop#readme"
  url "https://api.github.com/repos/JonDotsoy/envctl/tarball/v1.2.1"
  sha256 "d7b3b10d6938fa4527b35de660f9fa10d84b2fe2f6567f0b81481288d8e7606d"
  license "MIT"
  version "v1.2.1"

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
