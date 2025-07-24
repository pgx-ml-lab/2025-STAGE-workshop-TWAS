#!/usr/bin/env bash

function get_data() {
    # Get the assets from the latest release and untar them.
    release_data=$(curl -s https://api.github.com/repos/pgx-ml-lab/2025-STAGE-workshop-TWAS/releases)
    
    downloaded_files=$(echo "$release_data" | jq -r '.[0].assets[].browser_download_url' | xargs -n 1 basename)
    
    echo "$release_data" | jq -r '.[0].assets[].browser_download_url' | xargs -n 1 curl -LO

    for file in *.tar* *.tgz; do
        [ -f "$file" ] && tar -xaf "$file" --keep-old-files
    done
    
    # Clean up only the downloaded tar files
    for file in $downloaded_files; do
        [ -f "$file" ] && rm -f "$file"
    done
}

if [ -d "/workshop/local" ]; then
    pushd /workshop/local
    get_data
    popd
else
    get_data
fi

exec jupyter lab \
    --ip=0.0.0.0 \
    --port=8888 \
    --no-browser \
    --allow-root \
    --NotebookApp.token='' \
    --NotebookApp.password=''
