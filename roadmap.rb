class Roadmap < Formula
  desc ""
  homepage "https://github.com/JonDotsoy/ROADMAP.md#readme"
  url "https://api.github.com/repos/JonDotsoy/ROADMAP.md/tarball/cli-v0.1.1-beta.1"
  sha256 "a577afd14418550f6219ba3c6734031c63e21a1be91fe6e53be3c04f5399ec44"
  license "MIT"
  version "cli-v0.1.1-beta.1"

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
