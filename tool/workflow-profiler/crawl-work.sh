#!/bin/bash

directory="/workspace/rnaseq-out"

function iterate() {
  local dir="$1"

  for file in "$dir"/*; do
    if [ -f "$file" ]; then
        if [[ $file =~ ".gz" ]]; then
            gunzip -l $file
        else
            du -b $file
        fi
    fi

    if [ -d "$file" ]; then
      iterate "$file"
    fi
  done
}

iterate "$directory"
