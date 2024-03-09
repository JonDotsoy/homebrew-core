import { pathToFileURL } from "bun";
import { array, string, object, literal } from "zod";
import mustache from "mustache";

mustache.render;

const templates = {
  bunMake: new URL("templates/bun_make.rb.tmpl", import.meta.url),
};

export const schema = object({
  formules: array(
    object({
      name: string().regex(/^\w+(?:\w|-)*$/),
      description: string(),
      license: string(),
      template: literal("bun_make").transform(() => templates.bunMake),
      source: object({
        type: literal("github"),
        username: string(),
        repository: string(),
        branch: string(),
        workspace: string().startsWith('./').endsWith('/').optional(),
      }),
      strategy: literal("lastCommit"),
    }),
  ).optional(),
});
