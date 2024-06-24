class Demo < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/demo/tree/v1.2.0#readme"
  url "https://api.github.com/repos/JonDotsoy/demo/tarball/v1.2.0"
  sha256 "1569fc512320b38cd360c8dc84effb0350dd91b83a3d1e99461986ade19a7f34"
  license "MIT"

  depends_on "oven-sh/bun/bun"

  def install
    system "bun", "install"
    system "bun", "run", "build"
    bin.install "dist/demo" => "demo"
  end

  test do
    system "false"
  end
end
