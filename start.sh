#!/bin/sh

set -eu -o pipefail

export TEMPORAL_BROADCAST_ADDRESS=$(hostname -i)
export PROMETHEUS_ENDPOINT=$TEMPORAL_BROADCAST_ADDRESS:8233

# Check MySQL connectivity and database existence
sh ./check_mysql.sh

# Set up databases using the provided auto-setup.sh script
sh ./auto-setup.sh

# Start Temporal server
sh ./entrypoint.sh
