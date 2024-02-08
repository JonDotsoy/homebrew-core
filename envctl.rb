class Envctl < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/envctl/tree/develop#readme"
  url "https://api.github.com/repos/JonDotsoy/envctl/tarball/2b12535afa3ec274851b449c0245f3e27734ea30"
  sha256 "62dd2921453c05c75b8d3cb95b51d56b9a4f0db53829f45a9d26411f4dd56347"
  license "MIT"
  version "0.1.0-prev.62dd29214"

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
