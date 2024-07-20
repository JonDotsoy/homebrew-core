#!/usr/bin/env bun

import { GhApi } from "./utils/gh-api";
import { appendFile, writeFile } from "node:fs/promises";
import Handlebars from "handlebars";
import { digestFile } from "./utils/digest-file-url";


const setOutput = async (name: string, variable: string) => {
    const GITHUB_OUTPUT = process.env.GITHUB_OUTPUT;

    if (GITHUB_OUTPUT) {
        await appendFile(GITHUB_OUTPUT, `${name}=${variable}\n`);
    }
}

const handlebars = Handlebars.create()

const [_execPath, _scriptPath, repoName] = process.argv;

const configPath = new URL(`./templates/${repoName}.json`, import.meta.url);
const templatePath = new URL(`./templates/${repoName}.template`, import.meta.url);

const template = await Bun.file(templatePath).text();
const config = JSON.parse(await Bun.file(configPath).text());

const ghApi = new GhApi({ cache: false });

const repo = await ghApi.run('api', `/repos/${repoName}`).json()
const release = await ghApi.run('api', `/repos/${repoName}/releases/latest`).json()
const digest = await digestFile(new URL(release.tarball_url));
const output = new URL(config.output, configPath)
const render = handlebars.compile(template, { noEscape: true })({ digest, config, repo, release })

const hexFromArrayBuffer = (arrayBuffer: ArrayBuffer) => Array.from(new Uint8Array(arrayBuffer), e => e.toString(16).padEnd(2, '0')).join('')

const renderHash = hexFromArrayBuffer(await crypto.subtle.digest('sha1', new TextEncoder().encode(render)));
const outputHash = hexFromArrayBuffer(await crypto.subtle.digest('sha1', await Bun.file(output).arrayBuffer()));

const updated = renderHash !== outputHash

if (updated) {
    console.log(`Write file ${output}`)
    await writeFile(output, render);
}

await setOutput('release_tag_name', `${release.tag_name}`);
await setOutput('updated', `${updated}`);
await setOutput('output', `${output.pathname}`);
