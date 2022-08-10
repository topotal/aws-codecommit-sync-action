#!/bin/sh

set -euo pipefail

CODECOMMIT_URL="${INPUT_CODECOMMIT_URL}"

git config --global credential."${CODECOMMIT_URL}".helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true

git remote add codecommit ${CODECOMMIT_URL}
git push codecommit --mirror
