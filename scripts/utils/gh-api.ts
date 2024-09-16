import {
  readableStreamToArrayBuffer,
  readableStreamToJSON,
  readableStreamToText,
} from "bun";
import type { AffectedFileResult } from "typescript";

namespace GhApi {
  export interface Release {
    url: string;
    assets_url: string;
    upload_url: string;
    html_url: string;
    id: number;
    author: Author;
    node_id: string;
    tag_name: string;
    target_commitish: string;
    name: string;
    draft: boolean;
    prerelease: boolean;
    created_at: string;
    published_at: string;
    assets: any[];
    tarball_url: string;
    zipball_url: string;
    body: string;
  }

  export interface Author {
    login: string;
    id: number;
    node_id: string;
    avatar_url: string;
    gravatar_id: string;
    url: string;
    html_url: string;
    followers_url: string;
    following_url: string;
    gists_url: string;
    starred_url: string;
    subscriptions_url: string;
    organizations_url: string;
    repos_url: string;
    events_url: string;
    received_events_url: string;
    type: string;
    site_admin: boolean;
  }

  export interface Repo {
    id: number;
    node_id: string;
    name: string;
    full_name: string;
    private: boolean;
    owner: Owner;
    html_url: string;
    description: string;
    fork: boolean;
    url: string;
    forks_url: string;
    keys_url: string;
    collaborators_url: string;
    teams_url: string;
    hooks_url: string;
    issue_events_url: string;
    events_url: string;
    assignees_url: string;
    branches_url: string;
    tags_url: string;
    blobs_url: string;
    git_tags_url: string;
    git_refs_url: string;
    trees_url: string;
    statuses_url: string;
    languages_url: string;
    stargazers_url: string;
    contributors_url: string;
    subscribers_url: string;
    subscription_url: string;
    commits_url: string;
    git_commits_url: string;
    comments_url: string;
    issue_comment_url: string;
    contents_url: string;
    compare_url: string;
    merges_url: string;
    archive_url: string;
    downloads_url: string;
    issues_url: string;
    pulls_url: string;
    milestones_url: string;
    notifications_url: string;
    labels_url: string;
    releases_url: string;
    deployments_url: string;
    created_at: string;
    updated_at: string;
    pushed_at: string;
    git_url: string;
    ssh_url: string;
    clone_url: string;
    svn_url: string;
    homepage: string;
    size: number;
    stargazers_count: number;
    watchers_count: number;
    language: string;
    has_issues: boolean;
    has_projects: boolean;
    has_downloads: boolean;
    has_wiki: boolean;
    has_pages: boolean;
    has_discussions: boolean;
    forks_count: number;
    mirror_url: any;
    archived: boolean;
    disabled: boolean;
    open_issues_count: number;
    license: License;
    allow_forking: boolean;
    is_template: boolean;
    web_commit_signoff_required: boolean;
    topics: string[];
    visibility: string;
    forks: number;
    open_issues: number;
    watchers: number;
    default_branch: string;
    temp_clone_token: any;
    network_count: number;
    subscribers_count: number;
  }

  export interface Owner {
    login: string;
    id: number;
    node_id: string;
    avatar_url: string;
    gravatar_id: string;
    url: string;
    html_url: string;
    followers_url: string;
    following_url: string;
    gists_url: string;
    starred_url: string;
    subscriptions_url: string;
    organizations_url: string;
    repos_url: string;
    events_url: string;
    received_events_url: string;
    type: string;
    site_admin: boolean;
  }

  export interface License {
    key: string;
    name: string;
    spdx_id: string;
    url: string;
    node_id: string;
  }
}

type A<T> = T extends [`/repos/${string}/${string}/releases`]
  ? { target_commitish: string; name: string; tarball_url: string }[]
  : T extends ["api", `/repos/${string}/releases/latest`]
    ? GhApi.Release
    : T extends ["api", `/repos/${string}/releases/tags/${string}`]
      ? GhApi.Release
      : T extends ["api", `/repos/${string}`]
        ? GhApi.Repo
        : any;

type Options = {
  bin?: string;
  cache?: string | false;
};

export class GhApi {
  bin: string;
  cache: string | null;

  constructor(private options?: Options) {
    this.bin = options?.bin ?? "gh";
    if (options?.cache === false) {
      this.cache = null;
    } else {
      this.cache = options?.cache ?? "1h";
    }
  }

  run<T extends string[]>(...args: T) {
    const cmd = [
      this.bin,
      ...(this.cache ? ["--cache", this.cache] : []),
      ...args,
    ];
    console.log(`> ${cmd.join(" ")}`);

    const subProcess = Bun.spawn({
      cmd,
      stdout: "pipe",
      stderr: "inherit",
    });

    return {
      subProcess,
      text: async () => await readableStreamToText(subProcess.stdout),
      json: async <R = A<T>>(): Promise<R> =>
        await readableStreamToJSON(subProcess.stdout),
      stream: async () => await readableStreamToArrayBuffer(subProcess.stdout),
    };
  }
}

const ghApiCall = async (...args: string[]) => {
  return await new GhApi().run("api", ...args);
};

export const ghApi = async <T extends string[]>(...args: T): Promise<A<T>> => {
  const subProcess = await ghApiCall(...args);

  return await subProcess.json();
};

export const ghApiStream = async (...args: string[]) => {
  const subProcess = await ghApiCall(...args);

  return await subProcess.stream();
};
