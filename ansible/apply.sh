#!/bin/bash
set -o pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

./setup.sh

source activate ansible

ansible-playbook site.yaml

cp /home/vagrant/ansible/kubeconfig /home/vagrant/.kube/config