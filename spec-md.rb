class SpecMd < Formula
  desc "Documentation first methodology for writing tests."
  homepage "https://github.com/jondotsoy/spec.md/tree/develop#readme"
  url "https://api.github.com/repos/JonDotsoy/spec.md/tarball/v0.1.0"
  sha256 "c679a33c6457b9426098dc9a5dc968537677ed8841678565eb9f935c548252c7"
  license "MIT"
  version "v0.1.0"

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
