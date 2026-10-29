class Ndate < Formula
  desc "Date format to console"
  homepage "https://github.com/JonDotsoy/ndate#readme"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/JonDotsoy/ndate/releases/download/v0.5.1/ndate-aarch64-apple-darwin"
      sha256 "a17b920861b6b762734766669049f85c6e4d29aaa3dbc2ccc8995c4d3b7c7b64"
    end
    on_intel do
      url "https://github.com/JonDotsoy/ndate/releases/download/v0.5.1/ndate-x86_64-apple-darwin"
      sha256 "2a3c17d3a10f0b7b60c1bcd3c016877d9c363ec92a67c9eb270ed08f9ea77dbe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JonDotsoy/ndate/releases/download/v0.5.1/ndate-aarch64-unknown-linux-gnu"
      sha256 "0d9e80a7417db0889aa2169164d0f2e7e14305420dae2c7d5876f2a1985b0056"
    end
    on_intel do
      url "https://github.com/JonDotsoy/ndate/releases/download/v0.5.1/ndate-x86_64-unknown-linux-gnu"
      sha256 "d4561f97b677bbf30583eb0a45056242e1a258edda0848eeab441275e3578ea5"
    end
  end

  def install
    bin.install Dir["ndate-*"].first => "ndate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ndate --version")
  end
end
