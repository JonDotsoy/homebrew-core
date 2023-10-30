# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Uid < Formula
  desc "Unique ID generator"
  homepage "https://github.com/JonDotsoy/uid"
  url "https://api.github.com/repos/JonDotsoy/uid/tarball/v1.1.1-beta"
  sha256 "a82db2451586a238d6504181ed1c38695da6044f24338c54a7ddda9248866199"
  license "MIT"

  depends_on "oven-sh/bun/bun"

  def install
    system "bun", "i"
    system "bun", "build", "--compile", "uid.ts", "--outfile", "uid"
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
