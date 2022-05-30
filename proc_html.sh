#!/usr/bin/env bash
set -ex


mkdir -p $output


cats=( celebrity advertising fashion )
for cat in "${cats[@]}"
do
  # category
  mkdir -p $output/$cat
  echo "name: $cat" > cat.yaml
  gomplate -d config=$manifest -d cat=./cat.yaml -f $input/category/index.html -o $output/$cat/index_raw.html
  npx html-minifier \
    --collapse-whitespace --remove-comments --remove-optional-tags \
    --remove-redundant-attributes --remove-script-type-attributes \
    --remove-tag-whitespace --use-short-doctype \
    --minify-css true --minify-js true \
    -o $output/$cat/index.html $output/$cat/index_raw.html


  # story
  stories=( $(gomplate -d config=$manifest -d cat=./cat.yaml -i '{{ range (index (datasource "config").root (datasource "cat").name) }}{{.name}} {{ end }}') )
  for story in "${stories[@]}"
  do
    mkdir -p $output/$story
    echo "name: $story" > story.yaml
    gomplate -d config=$manifest -d cat=./cat.yaml -d story=./story.yaml -f $input/story/index.html -o $output/$story/index_raw.html
    npx html-minifier \
      --collapse-whitespace --remove-comments --remove-optional-tags \
      --remove-redundant-attributes --remove-script-type-attributes \
      --remove-tag-whitespace --use-short-doctype \
      --minify-css true --minify-js true \
      -o $output/$story/index.html $output/$story/index_raw.html
  done
done

# home
gomplate -d config=$manifest_home -f $input/index.html -o $output/index_raw.html
npx html-minifier \
  --collapse-whitespace --remove-comments --remove-optional-tags \
  --remove-redundant-attributes --remove-script-type-attributes \
  --remove-tag-whitespace --use-short-doctype \
  --minify-css true --minify-js true \
  -o $output/index.html $output/index_raw.html


# contact
mkdir -p $output/contact
npx html-minifier \
  --collapse-whitespace --remove-comments --remove-optional-tags \
  --remove-redundant-attributes --remove-script-type-attributes \
  --remove-tag-whitespace --use-short-doctype \
  --minify-css true --minify-js true \
  -o $output/contact/index.html $input/contact/index.html

find $output -type f -name index_raw.html | xargs rm -f

echo 'bye'
