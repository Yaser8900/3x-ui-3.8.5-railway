# Sanaei 3x-ui 3.8.5 — Railway build

This repository contains the Sanaei 3x-ui 3.8.5 source tree and builds the
panel from source with Docker. It does not depend on the prebuilt 3x-ui image.

## Railway compatibility

- `railway.json` keeps the Dockerfile deployment model used by the previous repository.
- `RailwayEntrypoint.sh` maps Railway's injected `PORT` to Sanaei's `XUI_PORT`.
- An explicitly configured `XUI_PORT` takes precedence.
- `/etc/x-ui` remains the panel database/settings path and is declared as a volume.
- The panel continues to bind normally through Sanaei's web listener.

## Build

Railway should deploy the repository using the root `Dockerfile`.
