class Focus < Formula
  desc ""
  homepage "https://github.com/JonDotsoy/focus#readme"
  url "https://api.github.com/repos/JonDotsoy/focus/tarball/demo"
  sha256 "de654450f2b88c93eeaced2956fa68a0b75e38775eeadfe9d68c6b5294de36a4"
  license ""
  version "demo"

  depends_on "oven-sh/bun/bun"
  depends_on "make"
  depends_on "jq"

  def install
    system "make", "install"
    system "make", "build"
    bin.install "bin/focus" => "focus"
    bin.install "bin/focusd" => "focusd"
  end

  test do
    system "false"
  end

  service do
    run [opt_bin/"focusd"]
    keep_alive true
    working_dir var
    log_path var/"log/focusd.log"
    error_log_path var/"log/focusd.log"
  end
end
