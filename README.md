# lts-kit

Shared kernel for the FSAE transient lap-time simulation: the `+lts/+util`
helper functions (`clamp`, `saturate`, `fieldOr`, `loadMatSafe`,
`PhysicalConstants`, ...) used by every component repository and the main
integration repository. It is mounted as a submodule in each of them.

## Ownership

| | |
|---|---|
| Department | Integration (simulation lead) |
| Maintainer | *add GitHub handle* |
| Term | *e.g. 2026/27* |

## Policy

This repository is a published library, not a workspace:

- Changes require integration-lead review (they affect every consumer).
- Semantic-version tags (`v1.x.y`); consumers pin via submodule bumps.
- High churn here is a smell — if you keep needing new kit functions,
  raise it with the lead instead of growing the kernel.

## Running the tests

MATLAB R2019b+ (CI pins R2026a):

    run_tests

The runner assembles a temporary `+lts/+util` package sandbox in `build/`
(gitignored) and runs `tests/`. No other repositories are required.

## Layout and workflow

- `main` — stable, release-only; advances only via the release cascade from the main `lts` repository. `staging` — where PRs from forks land.
- All development is done on forks; see [CONTRIBUTING.md](CONTRIBUTING.md).
- Contract and repository-split context:
  <https://jyjh.github.io/lts/repo-split/>
