#!/bin/bash

source test/_colors.sh

function run {
   NAME=$1
   COMMAND=$2

   blackb "Running test: $NAME"

   CURRENT_HEAD=$(git rev-parse --abbrev-ref HEAD)

   $2
   RESULT=$?

   git checkout $CURRENT_HEAD --quiet

   if [ $RESULT -ne 0 ]; then
      redb "Test failed: $NAME"
      exit $RESULT
   fi
}

run "create-message.sh" "./test/create-message.sh"
run "recent-commits.sh" "./test/recent-commits.sh"
run "advance-last-push.sh" "./test/advance-last-push.sh"

greenb "All tests passed!"
