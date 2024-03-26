class SpecMd < Formula
  desc "Documentation first methodology for writing tests."
  homepage "https://github.com/jondotsoy/spec.md/tree/develop#readme"
  url "https://api.github.com/repos/JonDotsoy/spec.md/tarball/v0.1.1"
  sha256 "cda808ede0ae4e3c0582db2ba9f4751a38818b882b8447c5235f95f75178ab25"
  license "MIT"
  version "v0.1.1"

  depends_on "oven-sh/bun/bun"
  depends_on "make"

  def install
    system "bun", "install"
    system "make", "build"
    bin.install "dist/spec-md" => "spec-md"
  end

  test do
    system "false"
  end
end
