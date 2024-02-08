import { zodToJsonSchema } from "zod-to-json-schema";
import { schema } from "./schema";
import { writeFile } from "fs/promises";

const schemaLocation = new URL("formulues.schema.json", import.meta.url);

await writeFile(
  schemaLocation,
  JSON.stringify(zodToJsonSchema(schema, "Manifest"), null, 2),
);

console.log(`Ready schema ${schemaLocation}`);
