#!/usr/bin/env bash
set -ex

export input_photos=~/Downloads/anjie_2020
export input=./public
export output=../anjieart.github.io
export manifest=./manifest.yaml
export manifest_home=./manifest_home.yaml

# ./proc_images.sh
./proc_html.sh
