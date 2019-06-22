#!/bin/bash

# create folder and .als file
mkdir "./test/"
cd test/
cp ../test_project.als test.als

# init git repo
git init

# commit
ableton_git.sh commit test "Test-commit"

# check xml file exists
if [ ! -f "test.xml" ]; then
    echo "commit failed - no xml file"
    exit 1
fi

# clear als file - can't simply compare before and after as gzip adds metadata
echo > test.als

# checkout
ableton_git.sh checkout test

# check als file matches xml
if [[ -z $(< test.als) ]]; then
  echo "checkout failed - als file content not reverted to commited version"
fi

# delete folder and repo
echo "test successful - removing test data"
cd ..
rm -rf test

exit 0