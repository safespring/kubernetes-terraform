#!/bin/bash
set -e
cd "$(dirname "${BASH_SOURCE[0]}")"

if [ ! -f terraform/localconf.tfvars ]; then
    echo "You must create terraform/localconf.tfvars" >&2
    exit 1
fi

pushd terraform
terraform init
terraform plan -var-file ipnett.tfvars -var-file localconf.tfvars
terraform apply -auto-approve -var-file ipnett.tfvars -var-file localconf.tfvars -parallelism=1 \
          -target openstack_networking_secgroup_rule_v2.rule_ssh_access_ipv4 \
          -target openstack_networking_secgroup_rule_v2.rule_kube_lb_http_ipv4 \
          -target openstack_networking_secgroup_rule_v2.rule_kube_lb_https_ipv4 \
          -target openstack_networking_secgroup_rule_v2.rule_kube_master_ipv4

terraform apply -auto-approve -var-file ipnett.tfvars -var-file localconf.tfvars
terraform output inventory >../ansible/inventory
popd

./ansible/apply.sh
