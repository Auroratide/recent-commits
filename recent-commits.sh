#!/bin/bash

set -euo pipefail

FROM_COMMIT=$1
TO_COMMIT=$2

git rev-list --format=oneline $FROM_COMMIT..$TO_COMMIT -- | tac
