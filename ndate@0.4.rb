class NdateAT04 < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate/tree/morgan-v0.4.1#readme"
  url "https://api.github.com/repos/JonDotsoy/ndate/tarball/morgan-v0.4.2"
  sha256 "3a92e85a2f83df9f530e39d5ea3ff99ca8cb5987237d6a8ecc3c8989d660d264"
  license "MIT"

  depends_on "deno"

  def install
    system "deno", "compile", "--allow-env=TZ,LANG", "ndate.ts"
    bin.install "ndate" => "ndate"
  end

  test do
    system "false"
  end
end
