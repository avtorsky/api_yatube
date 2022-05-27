#!/bin/bash

set -e
set -o pipefail

echo '-------------------------------// isort: mission accepted'
isort --profile black yatube_api/api
echo '-------------------------------// isort: mission accomplished ヽ(⚬_⚬)ノ'

echo '-------------------------------// black: mission accepted'
black --line-length 79 --skip-string-normalization yatube_api/api
echo '-------------------------------// black: mission accomplished ヽ(⚬_⚬)ノ'

echo '-------------------------------// pytest: mission accepted'
source venv/bin/activate
pytest
deactivate
echo '-------------------------------// pytest: mission accomplished ヽ(⚬_⚬)ノ'