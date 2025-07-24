#!/usr/bin/env bash

local_dir="${HOME}/STAGE2025_workshop_theme2"
mkdir -p $local_dir

docker run -i --rm \
    -p 8888:8888 \
    -v $local_dir:/workshop/local \
    ghcr.io/pgx-ml-lab/stage2025_theme2:latest

echo "Exiting!"
