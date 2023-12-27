# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Uid < Formula
  desc "Unique ID generator"
  homepage "https://github.com/JonDotsoy/uid"
  url "https://api.github.com/repos/JonDotsoy/uid/tarball/v1.3.0"
  sha256 "a49e08f59c3d8f84b45d49f3d4c0f08b80c78fa7c960191478fff52b8dc2b6fe"
  license "MIT"

  depends_on "bun"

  def install
    system "bun", "install"
    system "bun", "build","--compile","--outfile","uid","uid.ts"
    bin.install "uid" => "uid"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test uid`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
