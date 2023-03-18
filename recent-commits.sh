#!/bin/bash

set -euo pipefail

BASE_URL=$1
FROM_COMMIT=$2
TO_COMMIT=$3

REFS=$(git rev-list --format=oneline $FROM_COMMIT..$TO_COMMIT)
while read -r commit; do
	hash=$(echo "$commit" | cut -d' ' -f1)
	message=$(echo "$commit" | cut -d' ' -f2-)
	echo "  <$BASE_URL/commit/$hash|Link to commit>: $message"
done <<< "$REFS"
