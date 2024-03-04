class Envctl < Formula
  desc "Manager many environment files (.env.&lt;ctx&gt;) so easy."
  homepage "https://github.com/jondotsoy/envctl/tree/develop#readme"
  url "https://api.github.com/repos/JonDotsoy/envctl/tarball/v1.1.0"
  sha256 "1aa30f04bc15f08f015f4f7b0bc760eb9edac1b62ae26b7b6008eb2a96240e27"
  license "MIT"
  version "v1.1.0"

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
