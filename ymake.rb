class Ymake < Formula
  desc "Un ejecutor de tareas similar a Make pero con archivos YAML, con características modernas como builds matriciales y outputs estructurados"
  homepage "https://www.npmjs.com/package/@jondotsoy/ymake?activeTab=readme"
  url "https://registry.npmjs.org/@jondotsoy/ymake/-/ymake-1.5.2.tgz"
  sha256 "c7194ec1b980ee7cb042da84424ba0ae2e3209c5f23ebf61fdb08abece89b125"
  version "1.5.2"

  depends_on "oven-sh/bun/bun"

  def install
    system "bun", "install"
    system "bun", "build", "src/ymake.ts", "--compile", "--outfile", "ymake"
    bin.install "ymake"
  end
end
