#!/bin/bash

set -euo pipefail

source test/_assert.sh
source test/_colors.sh

blue "Setting up input variables"
AUTHOR_FILE="test/authors.json"

blue "Run script: Author is in the list"
RESULT=$(./author.sh $AUTHOR_FILE "Auroratide")

blue "Verifying result"
assert_eq "133742" "$RESULT" "Result did not match"

blue "Run script: Author NOT in the list"
RESULT=$(./author.sh $AUTHOR_FILE "NotFound")

blue "Verifying result"
assert_eq "" "$RESULT" "Result did not match"

green "Passed!"
