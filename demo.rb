class Demo < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/demo/tree/v1.1.0#readme"
  url "https://api.github.com/repos/JonDotsoy/demo/tarball/v1.1.0"
  sha256 "dd83b9ab1bd20fce0872689ffab5f6672731b9f4bd295dcebd0fa72d2fb02dd9"
  license "MIT"

  depends_on "bun"

  def install
    system "bun", "install"
    system "bun", "run", "build"
    bin.install "dist/demo" => "demo"
  end

  test do
    system "false"
  end
end
