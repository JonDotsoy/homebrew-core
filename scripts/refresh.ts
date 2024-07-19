#!/usr/bin/env bun

import { GhApi } from "./utils/gh-api";
import * as fs from "fs/promises";
import Handlebars from "handlebars";
import { digestFile } from "./utils/digest-file-url";

const handlebars = Handlebars.create()

const [_execPath, _scriptPath, repoName] = process.argv;

const configPath = new URL(`./templates/${repoName}.json`, import.meta.url);
const templatePath = new URL(`./templates/${repoName}.template`, import.meta.url);

const template = await fs.readFile(templatePath, 'utf-8');
const config = JSON.parse(await fs.readFile(configPath, 'utf-8'));

const ghApi = new GhApi({ cache: false });

const repo = await ghApi.run('api', `/repos/${repoName}`).json()
const release = await ghApi.run('api', `/repos/${repoName}/releases/latest`).json()
const digest = await digestFile(new URL(release.tarball_url));
const output = new URL(config.output, configPath)
const render =  handlebars.compile(template, { noEscape: true })({ digest, config, repo, release })

console.log(`Write file ${output}`)
await fs.writeFile(output, render);
