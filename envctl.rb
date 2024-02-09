class Envctl < Formula
  desc "Manager many environment files (.env.&lt;ctx&gt;) so easy."
  homepage "https://github.com/jondotsoy/envctl/tree/develop#readme"
  url "https://api.github.com/repos/jondotsoy/envctl/tarball/997dd88b6ee37b8b4eab98782084435cb24f7c50"
  sha256 "9033f6b00603326b343a771baef2afd3d17b1ee6475ed40fd37f751b5485e552"
  license "MIT"
  version "0.1.0-prev.b5485e552"

  depends_on "bun"
  depends_on "make"

  def install
    system "bun", "install"
    system "make", "build"
    bin.install "dist/envctl" => "envctl"
  end

  test do
    system "false"
  end
end
