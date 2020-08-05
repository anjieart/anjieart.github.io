#!/usr/bin/env bash
set -ex

input=/home/miles/repo/mc/anjie_2020/public
output=/home/miles/repo/mc/anjie_2020/output
manifest=/home/miles/repo/mc/anjie_2020/manifest2.yaml
manifest_home=/home/miles/repo/mc/anjie_2020/manifest_home.yaml


mkdir -p $output


# cats=( fashion advertising celebrity )
# for cat in "${cats[@]}"
# do
#   # category
#   mkdir -p $output/$cat
#   echo "name: $cat" > cat.yaml
#   gomplate -d config=$manifest -d cat=./cat.yaml -f $input/category/index.html -o $output/$cat/index_raw.html
#   html-minifier \
#     --collapse-whitespace --remove-comments --remove-optional-tags \
#     --remove-redundant-attributes --remove-script-type-attributes \
#     --remove-tag-whitespace --use-short-doctype \
#     --minify-css true --minify-js true \
#     -o $output/$cat/index.html $output/$cat/index_raw.html


#   # story
#   stories=( $(gomplate -d config=$manifest -d cat=./cat.yaml -i '{{ range (index (datasource "config").root (datasource "cat").name) }}{{.name}} {{ end }}') )
#   for story in "${stories[@]}"
#   do
#     mkdir -p $output/$story
#     echo "name: $story" > story.yaml
#     gomplate -d config=$manifest -d cat=./cat.yaml -d story=./story.yaml -f $input/story/index.html -o $output/$story/index_raw.html
#     html-minifier \
#       --collapse-whitespace --remove-comments --remove-optional-tags \
#       --remove-redundant-attributes --remove-script-type-attributes \
#       --remove-tag-whitespace --use-short-doctype \
#       --minify-css true --minify-js true \
#       -o $output/$story/index.html $output/$story/index_raw.html
#   done
# done

# home
gomplate -d config=$manifest_home -f $input/index.html -o $output/index_raw.html
html-minifier \
  --collapse-whitespace --remove-comments --remove-optional-tags \
  --remove-redundant-attributes --remove-script-type-attributes \
  --remove-tag-whitespace --use-short-doctype \
  --minify-css true --minify-js true \
  -o $output/index.html $output/index_raw.html


# contact
mkdir -p $output/contact
html-minifier \
  --collapse-whitespace --remove-comments --remove-optional-tags \
  --remove-redundant-attributes --remove-script-type-attributes \
  --remove-tag-whitespace --use-short-doctype \
  --minify-css true --minify-js true \
  -o $output/contact/index.html $input/contact/index.html


# echo 'root:' > $manifest


# cats=( fashion advertising celebrity )
# for cat in "${cats[@]}"
# do
#   echo "  $cat:" >> $manifest
#   i=0
#   for f in $input/$cat/*;
#   do
#     (( i=i+1 ))    
#     echo "  - name: $cat-$i" >> $manifest
#     echo "    description: Another $cat story $i" >> $manifest
#     echo "    photos:" >> $manifest
#     for p in $f/*;
#     do
#       n=$(sha1sum $p | awk '{print $1}' | head -c8)
#       echo "    - $n" >> $manifest
#       [[ ! -f $output/${n}_x100.jpg ]] && convert -thumbnail x100 $p  -quality 90 $output/${n}_x100.jpg
#       [[ ! -f $output/${n}_x400.jpg ]] && convert -thumbnail x400 $p  -quality 90 $output/${n}_x400.jpg
#       [[ ! -f $output/${n}_x800.jpg ]] && convert -resize x800 $p  -quality 90 $output/${n}_x800.jpg
#       [[ ! -f $output/${n}_x1200.jpg ]] && convert -resize x1200 $p  -quality 90 $output/${n}_x1200.jpg
#     done
#   done
# done


echo 'bye'
