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
HASH_1=$(git rev-parse HEAD)
echo "2" >> test.txt
git add test.txt
git commit -m "Add to test file" --quiet
HASH_2=$(git rev-parse HEAD)
git checkout main --quiet

blue "Run recent commits script"
RESULT=$(./recent-commits.sh BASE-URL last-push-to-test test-head)

blue "Verifying result matches expectation"
RESULT_LINE_1=$(echo "$RESULT" | head -1 | tail -1)
RESULT_LINE_2=$(echo "$RESULT" | head -2 | tail -1)

assert_eq "  <BASE-URL/commit/$HASH_2|Link to commit>: Add to test file" "$RESULT_LINE_1" "First commit line did not match"
assert_eq "  <BASE-URL/commit/$HASH_1|Link to commit>: Create test file" "$RESULT_LINE_2" "Second commit line did not match"

green "Passed!"
