class Q < Formula
  desc "Conversational AI project for facilitating conversations using YAML files"
  homepage "https://github.com/JonDotsoy/q-project#readme"
  url "https://api.github.com/repos/JonDotsoy/q-project/tarball/q-v0.3.0"
  sha256 "d4bf1981797afe85c9283bbe35955844583266cc02e884ff7a290f3ccf013325"
  license "MIT"
  version "q-v0.3.0"

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

