class Ndate < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate/tree/v0.3.0#readme"
  url "https://github.com/JonDotsoy/ndate/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "fd9fb4643ea9fabb007244ad4ee66e9a96afe8d7207fa8957e6aea57c650ca54"
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
