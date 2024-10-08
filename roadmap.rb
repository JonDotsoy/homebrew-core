class Roadmap < Formula
  desc ""
  homepage "https://github.com/JonDotsoy/ROADMAP.md#readme"
  url "https://api.github.com/repos/JonDotsoy/ROADMAP.md/tarball/cli-v0.2.0-beta.1"
  sha256 "f33971359744e4a19e7c888ecb46c24184909ea36cde5a7c9bf92368d0e79fe0"
  license "MIT"
  version "cli-v0.2.0-beta.1"

  depends_on "oven-sh/bun/bun"
  depends_on "make"
  depends_on "jq"

  def install
    chdir "packages/cli" do
        system "make", "install"
        system "make", "build"
        bin.install "dist/roadmap" => "roadmap"
    end
  end

  test do
    system "false"
  end
end
