#!/bin/bash

set -euo pipefail

source test/_assert.sh
source test/_colors.sh

blue "Setting up test branches"
git branch -D last-push-to-test --quiet &>/dev/null || true
git branch -D test-head --quiet &>/dev/null || true
git checkout -b test-head --quiet
git checkout main --quiet

blue "Run ensure branch exists script"
./ensure-branch-exists.sh last-push-to-test true

blue "Verifying branches are the same"
LAST_PUSH_HASH=$(git rev-parse last-push-to-test)
HEAD_HASH=$(git rev-parse test-head)

assert_eq "$LAST_PUSH_HASH" "$HEAD_HASH" "Branches are not the same"

green "Passed!"
