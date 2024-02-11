# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class GitAssistant < Formula
    desc "Make commits messages with AI. (use `git assistant init` in your project)"
    homepage "https://github.com/JonDotsoy/commands-help/tree/develop/commands/git-tools#readme"
    url "https://api.github.com/repos/jondotsoy/commands-help/tarball/git-assistant-v0.4.0"
    version "v0.4.0"
    sha256 "2674f6150086d09c4b6bb4d515e717f228bec5d0789ec378d7f5af6d679f80d1"
    license "MIT"
  
    depends_on "bun"
    depends_on "make"
  
    def install
      cd "commands/git-assistant" do
        system "make", "install"
        system "make", "build"
        bin.install "dist/git-assistant" => "git-assistant"
      end
    end
  
    # test do
    #   # `test do` will create, run in and delete a temporary directory.
    #   #
    #   # This test will fail and we won't accept that! For Homebrew/homebrew-core
    #   # this will need to be a test that verifies the functionality of the
    #   # software. Run the test with `brew test git-assistant`. Options passed
    #   # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #   #
    #   # The installed folder is not in the path, so use the entire path to any
    #   # executables being tested: `system "#{bin}/program", "do", "something"`.
    #   # system "false"
    # end
end
