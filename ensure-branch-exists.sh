#!/bin/bash

set -euo pipefail

BRANCH=$1

git rev-parse --verify --quiet $BRANCH

if [ $? -ne 0 ]; then
	echo "$BRANCH does not exist, creating it" >&2

	git checkout -b $BRANCH --quiet
	git push --set-upstream origin $BRANCH --quiet
fi