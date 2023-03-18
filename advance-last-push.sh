#!/bin/bash

set -euo pipefail

LAST_PUSH_BRANCH=$1
HEAD_BRANCH=$2
DRY_RUN=${3:-false}

git checkout $LAST_PUSH_BRANCH
git merge $HEAD_BRANCH --ff-only

if [ "$DRY_RUN" = "false" ]; then
   git push
fi
