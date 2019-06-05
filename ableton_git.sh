#!/bin/bash
#
# functions required to use Git with Ableton projects

# global vars
FILENAME=$1
MESSAGE=$2

function checkFileValid() {
  if [ -f "$FILENAME.als" ]; then
    exit 0
  else 
    echo "$FILENAME is not a valid Ableton project file"
    exit 1
  fi
}

function commit() {
  gzip -cd "$FILENAME.als" > "$FILENAME.xml"
  git add .
  git commit -m "$MESSAGE"
  exit 0
}

function checkout() {
  git checkout master
  gzip -c "$FILENAME.xml" > "$FILENAME.als"
  exit 0
}

"$@"
