#!/bin/bash

set -euo pipefail

source test/_assert.sh
source test/_colors.sh

blue "Setting up test branches"
git branch -D last-push-to-test --quiet &>/dev/null || true
git branch -D test-head --quiet &>/dev/null || true
git checkout -b last-push-to-test --quiet
git checkout -b test-head --quiet
echo "1" > test.txt
git add test.txt
git commit -m "Create test file" --quiet
echo "2" >> test.txt
git add test.txt
git commit -m "Add to test file" --quiet
git checkout main --quiet

blue "Run advance last push script"
./advance-last-push.sh last-push-to-test test-head true

blue "Verifying branches are the same"
LAST_PUSH_HASH=$(git rev-parse last-push-to-test)
HEAD_HASH=$(git rev-parse test-head)

assert_eq "$LAST_PUSH_HASH" "$HEAD_HASH" "Branches are not the same"

green "Passed!"
