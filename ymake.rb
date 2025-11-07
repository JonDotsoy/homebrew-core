class Ymake < Formula
  desc "Un ejecutor de tareas similar a Make pero con archivos YAML, con características modernas como builds matriciales y outputs estructurados"
  homepage "https://www.npmjs.com/package/@jondotsoy/ymake?activeTab=readme"
  url "https://registry.npmjs.org/@jondotsoy/ymake/-/ymake-1.0.5.tgz"
  sha256 "87b3889e99da3ee68db3703543eed09cd20d48634ab5cf9e0fd6a987fffd324a"
  version "1.0.5"

  depends_on "oven-sh/bun/bun"

  def install
    system "bun", "install"
    system "bun", "build", "src/ymake.ts", "--compile", "--outfile", "ymake"
    bin.install "ymake"
  end
end
