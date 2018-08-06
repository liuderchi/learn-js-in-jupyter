#!/bin/sh

set -e

npm config set package-lock false

for subdir in ./*; do
  if [[ -d $subdir ]]; then
    cd $subdir
    npm i
    cd ..
  fi
done
