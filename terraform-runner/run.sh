#!/usr/bin/with-contenv bashio
set -euo pipefail

TOKEN="$(bashio::config 'agent_token')"
if [ -z "${TOKEN}" ]; then
  bashio::log.fatal "agent_token is required. Configure the addon with your HCP Terraform agent pool token."
  exit 1
fi
export TFC_AGENT_TOKEN="${TOKEN}"

NAME="$(bashio::config 'agent_name')"
if [ -n "${NAME}" ]; then
  export TFC_AGENT_NAME="${NAME}"
fi

export TFC_AGENT_LOG_LEVEL="$(bashio::config 'log_level')"

if bashio::config.true 'single_mode'; then
  export TFC_AGENT_SINGLE=true
else
  export TFC_AGENT_SINGLE=false
fi

export TFC_ADDRESS="$(bashio::config 'tfc_address')"
export TFC_AGENT_DATA_DIR="/data"

bashio::log.info "Starting HCP Terraform agent (log level: ${TFC_AGENT_LOG_LEVEL})..."
exec tfc-agent
