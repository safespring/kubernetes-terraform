PaaS 2 kubernetes platform
==========================

This repository contains scripts and ansible playbooks for managing the PaaS 2 kubernetes platform.

## Bringing up a test cluster

Before firing up the Vagrant box, please first create a key-pair with `ssh-keygen -t rsa -b 4096 -f ./keys/id_rsa`

Then you can start the box with `vagrant up --provision`

In the `terraform` directory, make a `local.tfvars` based on the
example, check your setup with `terraform plan --var-file=localconf.tfvars
--var-file=ipnett.tfvars`, then bring up the bare machines with
`terraform apply --var-file=localconf.tfvars
--var-file=ipnett.tfvars`. The job prints out an ansible inventory at
the end.
