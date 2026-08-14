# adminer-helm

> **Note:** This README was generated with AI assistance. The Helm chart itself (templates, values, scripts) was written by hand.

> **⚠️ Not for production.** This chart is a personal learning/testing project for practicing Helm. It hasn't been hardened for production use (secrets, security, backups, HA, etc. are minimal or missing).

A Helm chart that deploys [Adminer](https://www.adminer.org/) alongside a PostgreSQL database (with optional streaming replication) for local testing and experimentation.

## What it deploys

- **Adminer** — Deployment + Service, configured to talk to the Postgres primary
- **Postgres** — StatefulSet + headless Service, with an init ConfigMap for setting up replication and cloning replicas from the primary
- A Secret holding the Postgres passwords

## Install

```bash
helm install my-release ./charts/adminer-chart
```

Then follow the instructions printed in the post-install NOTES to reach Adminer (e.g. via `kubectl port-forward`).

## Configuration

See `charts/adminer-chart/values.yaml` for all configurable options (replicas, resources, storage, ports, labels, etc.). Notable ones:

- `postgres.replication.enabled` / `postgres.replication.replicas` — toggle and size Postgres replication
- `postgres.password` / `postgres.replicationPassword` — override these rather than committing real credentials
- `adminer.service.extraSpec` — merge extra fields into the Adminer Service spec (e.g. `type: LoadBalancer`)

## Uninstall

```bash
helm uninstall my-release
```
