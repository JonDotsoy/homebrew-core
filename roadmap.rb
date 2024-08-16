class Roadmap < Formula
  desc ""
  homepage "https://github.com/JonDotsoy/ROADMAP.md#readme"
  url "https://api.github.com/repos/JonDotsoy/ROADMAP.md/tarball/cli-v0.1.0-beta.1"
  sha256 "30a67132c6dadcb26da350db3856b73189975f5598d59a5660d5a85575fb5f61"
  license "MIT"
  version "cli-v0.1.0-beta.1"

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
