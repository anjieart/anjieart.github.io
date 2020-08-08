#!/usr/bin/env bash
set -ex

output=$output/photos

mkdir -p $output
echo 'root:' > $manifest


cats=( fashion 73hours )
for cat in "${cats[@]}"
do
  echo "  $cat:" >> $manifest
  i=0
  for f in $input_photos/$cat/*;
  do
    (( i=i+1 ))
    story=${f##*/}
    echo "  - name: $story" >> $manifest
    echo "    description: $story" >> $manifest
    echo "    photos:" >> $manifest
    for p in $f/*;
    do
      n=$(sha1sum $p | awk '{print $1}' | head -c8)
      echo "    - $n" >> $manifest
      [[ ! -f $output/${n}_x100.jpg ]] && convert -thumbnail x100 $p  -quality 90 $output/${n}_x100.jpg
      [[ ! -f $output/${n}_x540.jpg ]] && convert -thumbnail x540 $p  -quality 90 $output/${n}_x540.jpg
      [[ ! -f $output/${n}_x800.jpg ]] && convert -resize x800 $p  -quality 95 $output/${n}_x800.jpg
      [[ ! -f $output/${n}_x1200.jpg ]] && convert -resize x1200 $p  -quality 95 $output/${n}_x1200.jpg
    done
  done
done


echo 'bye'
