#!/bin/bash

set -e

if [ -f .env.local ]
then
  export $(cat .env.local | sed 's/#.*//g' | xargs)
fi

if [ ! -z "$GITHUB_PERSONAL_TOKEN"]
then
  git clone https://$GITHUB_PERSONAL_TOKEN:x-oauth-basic@github.com/danielpox/hygen-danielpox.git && mv hygen-danielpox/_templates . && rm -rf hygen-danielpox
else
  echo 'You must provide a GitHub Personal Token. Have you copied .env.example to .env.local and made changes?'
fi
