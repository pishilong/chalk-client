#!/bin/bash

config_files=(
  dev.config.js
)

if [ -z $1 ]; then
  options="-iv"
else
  options=$1
fi

echo "Copying example config files..."
for f in "${config_files[@]}"
do
  cp $options "${f}.example" $f
done

echo "Done"
