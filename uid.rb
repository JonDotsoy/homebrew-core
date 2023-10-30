# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Uid < Formula
  desc "Unique ID generator"
  homepage "https://github.com/JonDotsoy/uid"
  url "https://api.github.com/repos/JonDotsoy/uid/tarball/v1.2.0"
  sha256 "2a80347c06d1b124294d236e78e5f790eb1eada25b1a2e5e3b157e27ea6cf14f"
  license "MIT"

  depends_on "deno"

  def install
    system "deno","compile","-o","uid","uid.ts"
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
