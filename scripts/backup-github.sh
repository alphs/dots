#!/usr/bin/env bash

curl -H "Authorization: Bearer $GITHUB_TOKEN" \
     -H "Content-Type: application/json" \
     -X POST https://api.github.com/graphql \
     -d '{"query":"query { viewer { repositories(first: 100, ownerAffiliations: OWNER) { nodes { sshUrl } } } }"}' \
  | jq -r '.data.viewer.repositories.nodes[].sshUrl' \
  | xargs -L1 git clone

