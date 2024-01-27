class Ndate < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate/tree/morgan-v0.4.1#readme"
  url "https://api.github.com/repos/JonDotsoy/demo/tarball/v1.0.0"
  sha256 "f02f7aa6f6002991c21e972fec049d910330c6b9de263ab8f380c93d99e1e710"
  license "MIT"

  depends_on "bun"

  def install
    system "bun", "install"
    system "bun", "run", "build"
    bin.install "dist/demo" => "demo"
  end

  test do
    system "false"
  end
end
