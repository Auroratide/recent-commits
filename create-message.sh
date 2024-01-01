#!/bin/bash

set -euo pipefail

BASE_URL=$1
REPO=$2
COMMITS=$3
AUTHOR_NOTIFY_ID=$4
GITHUB_ACTOR=$5

if [ -z "$COMMITS" ]; then
	exit 0
fi

echo "New commits to $REPO:"
while read -r commit; do
	hash=$(echo "$commit" | cut -d' ' -f1)
	message=$(echo "$commit" | cut -d' ' -f2-)
	echo "  <$BASE_URL/$REPO/commit/$hash|Link to commit>: $message"
done <<< "$COMMITS"

if [ -z "$AUTHOR_NOTIFY_ID" ]; then
   AUTHOR=$GITHUB_ACTOR
else
   AUTHOR="<@$AUTHOR_NOTIFY_ID>"
fi

echo "  Author: $AUTHOR"
