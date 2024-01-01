#!/bin/bash

BRANCH=$1
DRY_RUN=${2:-false}

git rev-parse --verify --quiet origin/$BRANCH
RESULT=$?

set -euo pipefail

if [ $RESULT -ne 0 ]; then
	echo "$BRANCH does not exist, creating it" >&2

	git checkout -b $BRANCH --quiet

	if [ "$DRY_RUN" = "false" ]; then
		git push --set-upstream origin $BRANCH --quiet
	fi

	git checkout - --quiet
fi
