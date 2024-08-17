class Cofy < Formula
  desc "Conversational AI project for facilitating conversations using YAML files"
  homepage "https://github.com/JonDotsoy/q-project#readme"
  url "https://api.github.com/repos/JonDotsoy/q-project/tarball/q-v0.7.0"
  sha256 "1379fded89fadbdfc1424753b5ce5c713cd8cac8ec34a0d497cd92794559f71b"
  license "MIT"
  version "q-v0.7.0"

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
