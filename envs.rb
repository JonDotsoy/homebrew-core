class Envs < Formula
  desc "CLI that keeps the .env values of every git worktree in a single file"
  homepage "https://github.com/JonDotsoy/envs#readme"
  url "https://registry.npmjs.org/@jondotsoy/envs/-/envs-0.1.9-alpha.3.tgz"
  sha256 "8e0e56509a0bb53c2cdbc867cd8a514309edfc0d7acd97e07f19601b1932908a"
  license "MIT"
  version "0.1.9-alpha.3"

  depends_on "oven-sh/bun/bun"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"envs.js"
    bin.install_symlink libexec/"envs.js" => "envs"
  end
end
