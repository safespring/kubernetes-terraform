PaaS 2 kubernetes platform
==========================

This repository contains scripts and ansible playbooks for managing the PaaS 2 kubernetes platform.

## Bringing up a test cluster

Before firing up the Kubernetes cluster, you can start the box with `vagrant up --provision`, and login via `vagrant ssh`

First, navigate to the `/tmp/terraform` directory, and configure the `local.tfvars`.

Then, you can run `terraform init` and subsequently check your setup with `terraform plan --var-file=localconf.tfvars
--var-file=ipnett.tfvars`.

It is possible to bring up the bare machines with
`terraform apply --var-file=localconf.tfvars
--var-file=ipnett.tfvars`. The job prints out an ansible inventory at
the end.
