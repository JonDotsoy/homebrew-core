class Envctl < Formula
  desc "Manager many environment files (.env.&lt;ctx&gt;) so easy."
  homepage "https://github.com/jondotsoy/envctl/tree/develop#readme"
  url "https://api.github.com/repos/JonDotsoy/envctl/tarball/v1.0.1"
  sha256 "8695406ae1d17b292ea3e284dadb56aea7136187f7dc7a58ab1d631cdb1a6f7f"
  license "MIT"
  version "v1.0.1"

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
