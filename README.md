<div align="center">

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/openplan-labs/branding/main/assets/logo/mark-dark.svg">
  <img src="https://raw.githubusercontent.com/openplan-labs/branding/main/assets/logo/mark-accent.svg" width="44" alt="OpenPlan Labs">
</picture>

# docker-pythonpddl

[PythonPDDL](https://github.com/openplan-labs/PythonPDDL) (`jupyddl`) in a container.

[![Docker Image CI](https://github.com/openplan-labs/docker-pythonpddl/actions/workflows/docker_image_ci.yml/badge.svg)](https://github.com/openplan-labs/docker-pythonpddl/actions/workflows/docker_image_ci.yml)
[![License](https://img.shields.io/github/license/openplan-labs/docker-pythonpddl.svg)](LICENSE)

</div>

Parse, ground and solve PDDL instances without installing anything but Docker.
The image is `python:3.12-slim` plus [`jupyddl`](https://pypi.org/project/jupyddl/)
from PyPI — no Julia, no submodules, nothing to build.

## Solve an instance

```sh
docker compose -f docker/docker-compose.yml build

# The repo is mounted at /workspace, so any PDDL file in it is visible.
docker compose -f docker/docker-compose.yml run --rm \
  -e DOMAIN=examples/dinner/domain.pddl \
  -e PROBLEM=examples/dinner/problem.pddl \
  python-pddl
```

`PLANNER` (default `astar`) and `HEURISTIC` (default `lmcut`) select the
search and heuristic — any name `jupyddl solve --help` lists. You can also
copy `.env.example` to `.env` and set them once.

## Use your own PDDL files

Anything in the repository directory is mounted at `/workspace`. Drop your
`domain.pddl`/`problem.pddl` anywhere in it and point `DOMAIN`/`PROBLEM` at
the relative paths. For a larger collection, see
[pddl-examples](https://github.com/openplan-labs/pddl-examples).

## Interactive session

Started without `DOMAIN`/`PROBLEM`, the container stays up so you can work
inside it:

```sh
docker compose -f docker/docker-compose.yml up -d
docker compose -f docker/docker-compose.yml exec python-pddl bash
jupyddl solve examples/dinner/domain.pddl examples/dinner/problem.pddl
```

## License

[Apache-2.0](LICENSE). Part of [OpenPlan Labs](https://github.com/openplan-labs).
