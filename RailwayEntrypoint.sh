#!/bin/sh
set -eu

# Railway injects PORT dynamically. Sanaei 3.8.5 supports XUI_PORT as a
# runtime-only override, so keep the stored panel port unchanged and make the
# process listen on Railway's assigned port.
if [ -z "${XUI_PORT:-}" ] && [ -n "${PORT:-}" ]; then
    export XUI_PORT="$PORT"
fi

# Railway needs the application to bind to the externally reachable port.
# Sanaei's default listener is 0.0.0.0 unless webListen is explicitly set.
exec /app/DockerEntrypoint.sh "$@"
