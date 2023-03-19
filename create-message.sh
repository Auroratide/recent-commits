#!/bin/bash

set -euo pipefail

BASE_URL=$1
REPO=$2
COMMITS=$3

echo "New commits to $REPO:"
while read -r commit; do
	hash=$(echo "$commit" | cut -d' ' -f1)
	message=$(echo "$commit" | cut -d' ' -f2-)
	echo "  <$BASE_URL/$REPO/commit/$hash|Link to commit>: $message"
done <<< "$COMMITS"
