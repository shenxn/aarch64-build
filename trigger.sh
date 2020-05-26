#!/bin/bash

set -ex

curl -H "Accept: application/vnd.github.everest-preview+json" \
    -H "Authorization: token ${PERSONAL_TOKEN}" \
    --request POST \
    --data "{\"event_type\": \"build\", \"client_payload\": {\"name\": \"${NAME}\", \"display_name\": \"${DISPLAY_NAME}\"}}" \
    https://api.github.com/repos/${GITHUB_REPOSITORY}/dispatches
