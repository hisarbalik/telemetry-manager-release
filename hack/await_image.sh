#!/usr/bin/env bash

# standard bash error handling
set -o nounset  # treat unset variables as an error and exit immediately.
set -o errexit  # exit immediately when a command fails.
set -E          # must be set if you want the ERR trap
set -o pipefail # prevents errors in a pipeline from being masked

# Expected variables:
#             IMAGE_REPO - binary image repository
#             GITHUB_TOKEN - github token
#             TRIGGER - event which triggered the workflow, for PRs it is the commit SHA, for push events it is the GITHUB_REF
#             QUERY_INTERVAL - time to wait between queries in seconds

PROTOCOL=docker://

# timeout after 15 minutes
TIMEOUT=900
START_TIME=$SECONDS


echo "Binary image: ${IMAGE_REPO}:${TRIGGER} available"
