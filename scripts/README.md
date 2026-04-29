# Maintainer scripts

These scripts are **not required to use or self-host OpenSnipping**. They
deploy the maintainer's hosted demo at
[yummyjars.com/opensnipping/](https://yummyjars.com/opensnipping/) and only
work with the maintainer's API key.

External contributors and self-hosters should use [`./serve.sh`](./serve.sh)
(or any static file server) — see the project [README](../README.md) for
self-host instructions.

## `serve.sh`

Zero-dependency local dev server (uses `python3 -m http.server` on port 8765
by default). Run from anywhere:

```bash
./scripts/serve.sh
PORT=3000 ./scripts/serve.sh   # custom port
```

## `deploy-prod.sh`

Deploys to `https://yummyjars.com/opensnipping/`. Requires:

| Variable | Required | Default |
|---|---|---|
| `YUMMYJARS_KEY` | yes | — |
| `YUMMYJARS_URL` | no | `https://yummyjars.com` |

Production deployment is also automated by
[`.github/workflows/deploy.yml`](../.github/workflows/deploy.yml) on every
push to `main`, so this script is only useful for fast iteration outside CI.

```bash
set -a && source .env && set +a
./scripts/deploy-prod.sh
```

## `deploy-lan.sh`

Deploys to the maintainer's LAN-only YummyJars instance. Unreachable from
GitHub runners, so there's no CI equivalent.

| Variable | Required | Default |
|---|---|---|
| `YUMMYJARS_KEY` | yes | — |
| `YUMMYJARS_LAN_URL` | no | `https://my.yummyjars.com` |

```bash
set -a && source .env.lan && set +a
./scripts/deploy-lan.sh
```

## `.env` files (maintainer only)

Both deploy scripts read `YUMMYJARS_KEY` from the environment. The
maintainer keeps `./.env` and `./.env.lan` in the repo root (gitignored). The
files contain a single line:

```
YUMMYJARS_KEY=<your-api-key>
```
