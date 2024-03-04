class Envctl < Formula
  desc "Manager many environment files (.env.&lt;ctx&gt;) so easy."
  homepage "https://github.com/jondotsoy/envctl/tree/develop#readme"
  url "https://api.github.com/repos/JonDotsoy/envctl/tarball/v1.2.0"
  sha256 "38c3722add225bb7d77a60a2648c3b30b21516cd8bcec89d6084b79a005a4f14"
  license "MIT"
  version "v1.2.0"

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
