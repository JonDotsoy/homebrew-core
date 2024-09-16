import { pathToFileURL } from "bun";
import { array, string, object, literal, union } from "zod";
import mustache from "mustache";

mustache.render;

const templates = {
  bunMake: new URL("templates/bun_make.rb.tmpl", import.meta.url),
  bunMakeSpecMd: new URL("templates/bun_make_spec_md.rb.tmpl", import.meta.url),
};

export const schema = object({
  formules: array(
    object({
      name: string().regex(/^\w+(?:\w|-)*$/),
      description: string(),
      license: string(),
      template: union([
        literal("bun_make").transform(() => templates.bunMake),
        literal("bun_make_spec_md").transform(() => templates.bunMakeSpecMd),
      ]),
      source: object({
        type: literal("github"),
        username: string(),
        repository: string(),
        branch: string(),
        workspace: string().startsWith("./").endsWith("/").optional(),
      }),
      strategy: literal("lastCommit"),
    }),
  ).optional(),
});
