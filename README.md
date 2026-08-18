# adminer-helm

> **Note:** This README was generated with AI assistance. The Helm chart itself (templates, values, scripts) was written by hand.

> **⚠️ Not for production.** This chart is a personal learning/testing project for practicing Helm. It hasn't been hardened for production use (secrets, security, backups, HA, etc. are minimal or missing).

A Helm chart that deploys [Adminer](https://www.adminer.org/) alongside a PostgreSQL database (with optional streaming replication) for local testing and experimentation.

## What it deploys

- **Adminer** — Deployment + Service, configured to talk to the Postgres primary
- **Postgres** — StatefulSet + headless Service, with an init ConfigMap for setting up replication and cloning replicas from the primary
- A Secret holding the Postgres passwords

## Install

Install directly from the OCI registry on GHCR:

```bash
helm install my-release oci://ghcr.io/devdariush/adminer-helm
```

Or add the chart repo once, then install from it:

```bash
helm repo add adminer-helm https://adminer-helm.d5h.io
helm repo update
helm install my-release adminer-helm/adminer-helm
```

Alternatively, install straight from a local checkout of this repo:

```bash
helm install my-release ./charts
```

You can also pull the chart archive directly:

```bash
helm pull oci://ghcr.io/devdariush/adminer-helm
```

Then follow the instructions printed in the post-install NOTES to reach Adminer (e.g. via `kubectl port-forward`).

## Configuration

See `charts/values.yaml` for all configurable options (replicas, resources, storage, ports, labels, etc.). Notable ones:

- `postgres.replication.enabled` / `postgres.replication.replicas` — toggle and size Postgres replication
- `postgres.password` / `postgres.replicationPassword` — override these rather than committing real credentials
- `adminer.service.extraSpec` — merge extra fields into the Adminer Service spec (e.g. `type: LoadBalancer`)

## Uninstall

```bash
helm uninstall my-release
```
