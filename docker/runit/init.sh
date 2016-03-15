#!/bin/sh
set -e
set -x

export DISPATCHER_PORT="${PORT0}"
export DISPATCHER_UI_PORT="${PORT1}"
export HISTORY_SERVER_PORT="${PORT2}"
export SPARK_PROXY_PORT="${PORT3}"
export WEBUI_URL="http://${FRAMEWORK_NAME}${DNS_SUFFIX}:${SPARK_PROXY_PORT}"
export HISTORY_SERVER_WEB_PROXY_BASE="/service/${FRAMEWORK_NAME}/history"
export DISPATCHER_UI_WEB_PROXY_BASE="/service/${FRAMEWORK_NAME}/dispatcher"

if [ "${ENABLE_HISTORY_SERVER:=false}" = "true" ]; then
    ln -s /var/lib/runit/service/history-server /etc/service/history-server
fi

# start service
exec runsvdir -P /etc/service
