# The Jondotsoy Homebrew Tap

A homebrew repository that provides a collection of projects to simplify application development and management.

## Setup

Before installing any projects, make sure to set up the tap by running:
```bash
brew tap jondotsoy/core
```
This will ensure that your system is aware of the projects provided by this tap.

## Available Projects

### Q-Project
Install: `brew install jondotsoy/core/q-project`

### NDate
Install: `brew install jondotsoy/core/ndate`

### UID
Install: `brew install jondotsoy/core/uid`

### Envctl
Install: `brew install jondotsoy/core/envctl`

### Demo
Install: `brew install jondotsoy/demo/demo` (Note: This project is not part of the core and is hosted in a separate repository)

### Spec-MD (Deprecated)
(Note: This project has been deprecated and is no longer maintained)

## Automatic Release via GitHub Workflow

You can automatically generate and publish new releases for this tap by invoking the `refresh.yml` workflow from another repository.

**Example Usage**

From your own repository, you can run:

```shell
gh workflow run --repo JonDotsoy/homebrew-core refresh.yml -F repo_name=JonDotsoy/q-project
```

This will trigger a new release for the `q-project` formula with the latest version available.

**Workflow Example**

You can find an example of how to invoke this workflow in the `.github/workflows/release.yaml` file of the `q-project` repository: https://github.com/JonDotsoy/q-project/blob/develop/.github/workflows/release.yaml

## License

This project is released under the MIT License. You can find more information about the license in the [LICENSE](./LICENSE) file.
