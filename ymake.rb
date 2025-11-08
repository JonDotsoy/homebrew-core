class Ymake < Formula
  desc "Un ejecutor de tareas similar a Make pero con archivos YAML, con características modernas como builds matriciales y outputs estructurados"
  homepage "https://www.npmjs.com/package/@jondotsoy/ymake?activeTab=readme"
  url "https://registry.npmjs.org/@jondotsoy/ymake/-/ymake-1.3.0.tgz"
  sha256 "1999a25350de1e8e0cd8e3c5da33b44edecdf890ce7c818192f4d364b833a3e1"
  version "1.3.0"

  depends_on "oven-sh/bun/bun"

  def install
    system "bun", "install"
    system "bun", "build", "src/ymake.ts", "--compile", "--outfile", "ymake"
    bin.install "ymake"
  end
end
