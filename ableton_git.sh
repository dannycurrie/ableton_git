#!/bin/bash -x
#
# functions required to use Git with Ableton projects

# global vars

function checkFileValid() {
  if [ ! -f "$1.als" ]; then
    echo "$1 is not a valid Ableton project file"
    exit 1
  fi
}

function checkMessageValid() {
  if [ -z $1 ]; then
    echo "Commit message cannot be empty"
    exit 1
  fi
}

function commit() {
  FILENAME=$1
  MESSAGE=$2
  checkFileValid $FILENAME
  checkMessageValid $MESSAGE
  gzip -cd "$FILENAME.als" > "$FILENAME.xml"
  git add .
  git commit -m "$MESSAGE"
  exit 0
}

function checkout() {
  FILENAME=$1
  checkFileValid $FILENAME
  git checkout master
  gzip -c "$FILENAME.xml" > "$FILENAME.als"
  exit 0
}

"$@"
