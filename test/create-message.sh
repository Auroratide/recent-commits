#!/bin/bash

set -euo pipefail

source test/_assert.sh
source test/_colors.sh

blue "Setting up input variables"
BASE_URL="BASE-URL"
REPO="REPO"
COMMITS="abc123 Commit One
bcd234 Commit Two"

blue "Run script"
RESULT=$(./create-message.sh "$BASE_URL" "$REPO" "$COMMITS")

blue "Verifying result"
RESULT_LINE_1=$(echo "$RESULT" | head -1 | tail -1)
RESULT_LINE_2=$(echo "$RESULT" | head -2 | tail -1)
RESULT_LINE_3=$(echo "$RESULT" | head -3 | tail -1)

assert_eq "New commits to REPO:" "$RESULT_LINE_1" "First line did not match"
assert_eq "  <BASE-URL/REPO/commit/abc123|Link to commit>: Commit One" "$RESULT_LINE_2" "Second line did not match"
assert_eq "  <BASE-URL/REPO/commit/bcd234|Link to commit>: Commit Two" "$RESULT_LINE_3" "Third line did not match"

green "Passed!"
