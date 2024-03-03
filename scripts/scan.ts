import * as YAML from "yaml";
import { writeFile, readFile } from "fs/promises";
import { schema } from "./schema";
import { readableStreamToArrayBuffer, readableStreamToJSON } from "bun";
import handlebars from "handlebars";
import { normalizeClassName } from "./utils/classname";
import { loadManifest } from "./utils/manifest";
import { ghApi, ghApiStream } from "./utils/gh-api";

const formulesLocation = new URL("../formulues.yaml", import.meta.url);

const manifest = await loadManifest(formulesLocation);

for (const formule of manifest.formules ?? []) {
  const className = normalizeClassName(formule.name);
  const formuleDestination = new URL(`../${formule.name}.rb`, import.meta.url);
  const out = await ghApi(
    `/repos/${formule.source.username}/${formule.source.repository}/commits/${formule.source.branch}`,
  );

  const sha = out.sha;

  const homePage = new URL(
    `https://github.com/${formule.source.username}/${formule.source.repository}/tree/${formule.source.branch}#readme`,
  );
  const sourceDownload = new URL(
    `/repos/${formule.source.username}/${formule.source.repository}/tarball/${sha}`,
    `https://api.github.com`,
  );
  const buff = await ghApiStream(
    `/repos/${formule.source.username}/${formule.source.repository}/tarball/${sha}`,
  );

  const description = formule.description;
  const license = formule.license;
  const digest = await crypto.subtle.digest("sha256", buff);
  const digestHex = Array.from(new Uint8Array(digest), (e) =>
    e.toString(16).padStart(2, "0"),
  ).join("");
  const template = new TextDecoder().decode(
    new Uint8Array(await readFile(formule.template)),
  );
  const versionName = `0.1.0-prev.${digestHex.substring(digestHex.length - 9)}`;

  await writeFile(
    formuleDestination,
    handlebars.compile(template)({
      description,
      license,
      className,
      homePage,
      sourceDownload,
      digestHex,
      versionName,
    }),
  );
}
