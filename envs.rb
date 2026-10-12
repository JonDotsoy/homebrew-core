class Envs < Formula
  desc "CLI that keeps the .env values of every git worktree in a single file"
  homepage "https://github.com/JonDotsoy/envs#readme"
  url "https://registry.npmjs.org/@jondotsoy/envs/-/envs-0.1.8.tgz"
  sha256 "4b1c82a64d5f8b32b5b9fcb80bc975e8508c607f66a3a4383b7cac070e1620e0"
  license "MIT"
  version "0.1.8"

  depends_on "oven-sh/bun/bun"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"envs.js"
    bin.install_symlink libexec/"envs.js" => "envs"
  end
end
