class Ymake < Formula
  desc "Un ejecutor de tareas similar a Make pero con archivos YAML, con características modernas como builds matriciales y outputs estructurados"
  homepage "https://www.npmjs.com/package/@jondotsoy/ymake?activeTab=readme"
  url "https://registry.npmjs.org/@jondotsoy/ymake/-/ymake-1.5.1.tgz"
  sha256 "96b88000f55b1c0e56a67f2b90ba9352f53c788cab30f22249e54d925f8b740b"
  version "1.5.1"

  depends_on "oven-sh/bun/bun"

  def install
    system "bun", "install"
    system "bun", "build", "src/ymake.ts", "--compile", "--outfile", "ymake"
    bin.install "ymake"
  end
end
