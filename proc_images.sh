#!/usr/bin/env bash
set -ex

input=/home/miles/Downloads/xintu
output=/home/miles/repo/mc/anjie_2020/output/photos
manifest=/home/miles/repo/mc/anjie_2020/manifest2.yaml


mkdir -p $output
echo 'root:' > $manifest


cats=( fashion advertising celebrity )
for cat in "${cats[@]}"
do
  echo "  $cat:" >> $manifest
  i=0
  for f in $input/$cat/*;
  do
    (( i=i+1 ))    
    echo "  - name: $cat-$i" >> $manifest
    echo "    description: Another $cat story $i" >> $manifest
    echo "    photos:" >> $manifest
    for p in $f/*;
    do
      n=$(sha1sum $p | awk '{print $1}' | head -c8)
      echo "    - $n" >> $manifest
      [[ ! -f $output/${n}_x100.jpg ]] && convert -thumbnail x100 $p  -quality 90 $output/${n}_x100.jpg
      [[ ! -f $output/${n}_x400.jpg ]] && convert -thumbnail x400 $p  -quality 90 $output/${n}_x400.jpg
      [[ ! -f $output/${n}_x800.jpg ]] && convert -resize x800 $p  -quality 90 $output/${n}_x800.jpg
      [[ ! -f $output/${n}_x1200.jpg ]] && convert -resize x1200 $p  -quality 90 $output/${n}_x1200.jpg
    done
  done
done


echo 'bye'
