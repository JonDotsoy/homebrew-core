class Envctl < Formula
  desc "Manager many environment files (.env.&lt;ctx&gt;) so easy."
  homepage "https://github.com/jondotsoy/envctl/tree/develop#readme"
  url "https://api.github.com/repos/JonDotsoy/envctl/tarball/v1.3.0"
  sha256 "14f3ac341cf942981eeb07b91aeae671343f22a7bbfdb9ee5ce73af99c3d4765"
  license "MIT"
  version "v1.3.0"

  depends_on "oven-sh/bun/bun"
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
