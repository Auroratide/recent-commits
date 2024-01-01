#!/bin/bash

ACTUAL_OUTPUT=$1
EXPECTED_PHRASE=$(git show -s --format=%B HEAD)

echo $ACTUAL_OUTPUT

if [[ $ACTUAL_OUTPUT != *"$EXPECTED_PHRASE"* ]]; then
   echo ""
   echo "FAIL: Expected phrase '$EXPECTED_PHRASE' not found in output"
   exit 1
fi

echo ""
echo "Action verification succeeded!"
