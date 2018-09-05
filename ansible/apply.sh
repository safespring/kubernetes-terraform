#!/bin/bash
set -o pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

./setup.sh

source activate ansible

ansible-playbook site.yaml