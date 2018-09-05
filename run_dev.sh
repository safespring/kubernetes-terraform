#!/bin/bash
set -e
cd "$(dirname "${BASH_SOURCE[0]}")"

if [ ! -f terraform/local.tfvars ]; then
    echo "You must create terraform/local.tfvars" >&2
    exit 1
fi

pushd terraform
terraform init
terraform plan -var-file ipnett.tfvars -var-file localconf.tfvars
terraform apply -var-file ipnett.tfvars -var-file localconf.tfvars -parallelism=1 \
          -target openstack_networking_secgroup_rule_v2.rule_ssh_access_ipv4 \
          -target openstack_networking_secgroup_rule_v2.rule_kube_lb_http_ipv4 \
          -target openstack_networking_secgroup_rule_v2.rule_kube_lb_https_ipv4 \
          -target openstack_networking_secgroup_rule_v2.rule_kube_master_ipv4

# Now, do the rest in parallell as normal
terraform apply -var-file ipnett.tfvars -var-file local.tfvars
terraform output inventory >../ansible/inventory
popd

./ansible/apply.sh
