#!/usr/bin/env bash
set -ex

export input_photos=/home/miles/Downloads/anjie_2020
export input=/home/miles/repo/mc/anjieart.github.io/public
export output=/home/miles/repo/mc/anjieart.github.io_rel
export manifest=/home/miles/repo/mc/anjieart.github.io/manifest.yaml
export manifest_home=/home/miles/repo/mc/anjieart.github.io/manifest_home.yaml

# ./proc_images.sh
./proc_html.sh
