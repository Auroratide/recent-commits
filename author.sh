#!/bin/bash

set -euo pipefail

ACTORS_FILE=$1
ACTOR=$2

cat $ACTORS_FILE | jq -r ".users[] | select(.github == \"${ACTOR}\") | .notify_id"
