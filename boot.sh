#!/bin/sh
DEFAULT_CONF=nginx.conf
DEFAULT_ROOT="$(pwd)"

CONF="${1:-$DEFAULT_CONF}"
ROOT="${2:-$DEFAULT_ROOT}"

OUT_CONF="$CONF.compiled"
(
	mkdir -p logs
	touch logs/access.log logs/error.log
	#Redirect NGINX logs to stdout.
	echo 'buildpack=nginx at=logs-initialized'
	tail -qF -n 0 logs/*.log
	echo 'logs' >$psmgr
) &


(
	cd "$ROOT"
	cat "$CONF" | compile_nginx_config.lua > "$OUT_CONF"
	LD_LIBRARY_PATH="/app/packages/lib" nginx -p "$(pwd)" -c "$OUT_CONF"
)

