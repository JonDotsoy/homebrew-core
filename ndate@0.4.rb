class NdateAT04 < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate/tree/morgan-v0.4.1#readme"
  url "https://api.github.com/repos/JonDotsoy/ndate/tarball/morgan-v0.4.2"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
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
