export function normalizeClassName(name: string): string {
  return name
    .split(/-/g)
    .map((chunk) => `${chunk[0].toUpperCase()}${chunk.substring(1)}`)
    .join("");
}
