class Ymake < Formula
  desc "Un ejecutor de tareas similar a Make pero con archivos YAML, con características modernas como builds matriciales y outputs estructurados"
  homepage "https://www.npmjs.com/package/@jondotsoy/ymake?activeTab=readme"
  url "https://registry.npmjs.org/@jondotsoy/ymake/-/ymake-1.4.0.tgz"
  sha256 "8dfc9dac013b46586a175c7b9843f187b986bf3a64d19de408e66c13119f4ada"
  version "1.4.0"

  depends_on "oven-sh/bun/bun"

  def install
    system "bun", "install"
    system "bun", "build", "src/ymake.ts", "--compile", "--outfile", "ymake"
    bin.install "ymake"
  end
end
