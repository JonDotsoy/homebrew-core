class Q < Formula
  desc "Conversational AI project for facilitating conversations using YAML files"
  homepage "https://github.com/jondotsoy/q-project/tree/develop#readme"
  url "https://api.github.com/repos/JonDotsoy/q-project/tarball/q-v0.1.1"
  sha256 "fa0ecdd3ac40b9df2eb43414cbe22ac77baf505aa8280b37dbc09f751f9c5858"
  license "MIT"
  version "v0.1.1"

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
