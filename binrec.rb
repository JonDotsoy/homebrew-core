class Binrec < Formula
  desc "Record everything a command reads and writes"
  homepage "https://github.com/JonDotsoy/binrec"
  url "https://github.com/JonDotsoy/binrec/releases/download/v0.0.10/binrec.js"
  version "0.0.10"
  sha256 "739abe705d5fbfa9bbd7fd35f5b310296de43ff8f6c154be9afc262065471758"
  license "MIT"

  depends_on "oven-sh/bun/bun"

  def install
    bin.install "binrec.js" => "binrec"
  end

  # binrec 0.0.3 and older wrote records other users could read.
  def post_install
    records = Pathname.new(Dir.home)/".binrec/records"
    return unless records.directory?

    records.chmod 0700
    records.glob("*.{ndjson,json}").each { |file| file.chmod 0600 }
  rescue Errno::EPERM, Errno::EACCES
    opoo "Could not make #{records} private, run: chmod 700 #{records} && chmod 600 #{records}/*"
  end

  def caveats
    <<~EOS
      Records written by binrec 0.0.3 or older may be readable by other users.
      If you use another BINREC_HOME, make its records private with:
        chmod 700 "$BINREC_HOME/records" && chmod 600 "$BINREC_HOME/records/"*
    EOS
  end

  test do
    system bin/"binrec"
  end
end
