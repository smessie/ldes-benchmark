#!/bin/bash

# Replication of Telraam benchmark
ENV_DIR_TELRAAM_REPLICATION="/users/iesmessa/ldes-benchmark/configs/telraam/replication"
OUT_DIR_TELRAAM_REPLICATION="/groups/ilabt-imec-be/semic-ldes/ldes-benchmark-results/telraam/replication"

find "$ENV_DIR_TELRAAM_REPLICATION" -type f \( -name "*40c.env" -o -name "*50c.env" \) | while read env_file; do
    base_name=$(basename "$env_file" .env)

    out_file="$OUT_DIR_TELRAAM_REPLICATION/${base_name}.json"

    NODE_OPTIONS=--max-old-space-size=20480 npx ldes-evaluation-runner-orchestrator "$env_file" "$out_file" "$SERVER_HOSTNAME"

    docker compose -f node_modules/ldes-evaluation-runner-orchestrator/docker-compose.yml down
done

# Synchronization of Telraam benchmark
ENV_DIR_TELRAAM_SYNCHRONIZATION="/users/iesmessa/ldes-benchmark/configs/telraam/synchronization"
OUT_DIR_TELRAAM_SYNCHRONIZATION="/groups/ilabt-imec-be/semic-ldes/ldes-benchmark-results/telraam/synchronization"

find "$ENV_DIR_TELRAAM_SYNCHRONIZATION" -type f \( -name "*20c.env" -o -name "*50c.env" \) | while read env_file; do
    base_name=$(basename "$env_file" .env)

    out_file="$OUT_DIR_TELRAAM_SYNCHRONIZATION/${base_name}.json"

    NODE_OPTIONS=--max-old-space-size=20480 npx ldes-evaluation-runner-orchestrator "$env_file" "$out_file" "$SERVER_HOSTNAME"

    docker compose -f node_modules/ldes-evaluation-runner-orchestrator/docker-compose.yml down
done
