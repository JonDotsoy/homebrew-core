class NdateAT04 < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate/tree/morgan-v0.4.1#readme"
  url "https://github.com/JonDotsoy/ndate/archive/refs/tags/morgan-v0.4.1.tar.gz"
  sha256 "f05656c580abd17f5ff590500a01cc2b717732ac6f463a8ba1ee7335b02f2b8c"
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
