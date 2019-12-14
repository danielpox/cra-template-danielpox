#!/bin/bash

set -e

if [ -f .env.local ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

git clone https://$GITHUB_PERSONAL_TOKEN:x-oauth-basic@github.com/danielpox/hygen-danielpox.git && mv hygen-danielpox/_templates . && rm -rf hygen-danielpox
