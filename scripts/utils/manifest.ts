import * as YAML from "yaml";
import * as fs from "fs/promises";
import { schema } from "../schema";

export const loadManifest = async (location: URL) =>
  schema.parse(
    YAML.parse(
      new TextDecoder().decode(new Uint8Array(await fs.readFile(location))),
    ),
  );
