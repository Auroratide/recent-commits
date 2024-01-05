#!/bin/bash

TAG=$1
MAJOR=$(echo $TAG | cut -d. -f1)
MINOR=$(echo $TAG | cut -d. -f2)

git tag -a "v$MAJOR" -m "v$MAJOR"
git tag -a "v$MAJOR.$MINOR" -m "v$MAJOR.$MINOR"

git push --tags --force
