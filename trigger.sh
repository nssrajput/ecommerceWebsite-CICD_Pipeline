#!/bin/bash

# variables
BRANCH="master"
DIRECTORY="frontend"
LAST_COMMIT_FILE="last_commit_sha.txt"

# Get the latest commit SHA of the specified directory
latest_commit_sha=$(git rev-list -1 $BRANCH -- $DIRECTORY)

# Check if there are new commits in the specified directory since the last known commit
if [ "$latest_commit_sha" != "$(cat $LAST_COMMIT_FILE 2>/dev/null)" ]; then
    echo "New commits detected in $DIRECTORY"
    # Trigger CI/CD process
    ./test.sh

    # Update the last known commit SHA in the file
    echo "$latest_commit_sha" > $LAST_COMMIT_FILE
else
    echo "No new commits in $DIRECTORY"
fi
