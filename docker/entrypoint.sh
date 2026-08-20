#!/usr/bin/env sh
set -e

# If a domain and problem are provided (flags or .env via docker compose),
# solve them and exit. Otherwise run the given command, which defaults to
# keeping the container alive so you can `docker exec` into it.
if [ -n "$DOMAIN" ] && [ -n "$PROBLEM" ]; then
    exec jupyddl solve "$DOMAIN" "$PROBLEM" \
        ${PLANNER:+-s "$PLANNER"} \
        ${HEURISTIC:+-H "$HEURISTIC"}
fi

exec "$@"
