#!/bin/bash
#
# functions required to use Git with Ableton projects

# global vars

function commit() {
  FILENAME=$1
  MESSAGE=$2
  gzip -cd "$FILENAME.als" > "$FILENAME.xml"
  git add .
  git commit -m "$MESSAGE"
  exit 0
}

function checkout() {
  FILENAME=$1
  git checkout master
  gzip -c "$FILENAME.xml" > "$FILENAME.als"
  exit 0
}

"$@"
