class Q < Formula
  desc "Conversational AI project for facilitating conversations using YAML files"
  homepage "https://github.com/JonDotsoy/q-project#readme"
  url "https://api.github.com/repos/JonDotsoy/q-project/tarball/q-v0.4.0"
  sha256 "1bc98618cb47a739e92eb94a90ea2e82204c55c871df7f008bd5fdcd49ea5324"
  license "MIT"
  version "q-v0.4.0"

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
