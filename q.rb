class Q < Formula
  desc "Conversational AI project for facilitating conversations using YAML files"
  homepage "https://github.com/JonDotsoy/q-project#readme"
  url "https://api.github.com/repos/JonDotsoy/q-project/tarball/q-v0.5.0"
  sha256 "523124216275f41f4b6e4aa2f7d4599d61e8c96e2902a7ba3a120c6565514869"
  license "MIT"
  version "q-v0.5.0"

  depends_on "oven-sh/bun/bun"
  depends_on "make"

  def install
    system "make", "install"
    system "make", "build"
    bin.install "dist/q" => "q"
  end

  test do
    system "false"
  end
end
