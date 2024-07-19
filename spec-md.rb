class SpecMd < Formula
  desc "Documentation first methodology for writing tests."
  homepage "https://github.com/JonDotsoy/specmark#readme"
  url "https://api.github.com/repos/JonDotsoy/specmark/tarball/v0.2.5"
  sha256 "4e94ff1e82f8116aa0ac07bc3b33914a8332fa8257d491af45d34a4bd306ebea"
  license "MIT"
  version "v0.2.5"

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
