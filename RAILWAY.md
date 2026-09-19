# Sanaei 3x-ui 3.8.5 — Railway

This repository is a source build of Sanaei 3x-ui v3.8.5.

## Railway build

The Dockerfile compiles the frontend and Go backend inside Railway's Docker build.
It does not depend on a prebuilt 3x-ui runtime image.

The Go builder uses a fallback `GOPROXY` chain:

1. proxy.golang.org
2. goproxy.io
3. goproxy.cn
4. proxy.golang.com.cn
5. mirrors.aliyun.com/goproxy
6. direct

The chain uses `|`, so Go can continue on network/proxy availability errors.

## Railway port

`RailwayEntrypoint.sh` maps Railway's injected `PORT` to Sanaei's `XUI_PORT` when
`XUI_PORT` has not been explicitly configured. This keeps the existing Railway
model while allowing Sanaei to listen on Railway's assigned port.

## Persistent data

Mount a Railway Volume at `/etc/x-ui` so the SQLite database and panel data survive
redeploys/restarts.
