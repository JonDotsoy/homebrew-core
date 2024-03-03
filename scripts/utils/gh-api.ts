import { readableStreamToArrayBuffer, readableStreamToJSON } from "bun";

const ghApiCall = (...args: string[]) => {
  const cmd = ["gh", "api", "--cache", "1h", ...args];
  console.log(`> Call ${cmd.join(" ")}`);
  const subProcess = Bun.spawn({
    cmd,
    stdout: "pipe",
    stderr: "pipe",
  });

  return subProcess;
};

type A<T> = T extends [`/repos/${string}/${string}/releases`]
  ? { target_commitish: string; name: string; tarball_url: string }[]
  : any;

export const ghApi = async <T extends string[]>(...args: T): Promise<A<T>> => {
  const subProcess = ghApiCall(...args);

  return await readableStreamToJSON(subProcess.stdout);
};

export const ghApiStream = async (...args: string[]) => {
  const subProcess = ghApiCall(...args);

  return await readableStreamToArrayBuffer(subProcess.stdout);
};
