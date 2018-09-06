PaaS 2 kubernetes platform
==========================

This repository contains scripts and ansible playbooks for managing the PaaS 2 kubernetes platform.

## Bringing up a test cluster
 
Before firing up the Kubernetes cluster, you need to login to the Vagrant box:
```bash
> vagrant up --provision
> vagrant ssh
```
Navigate to the `/tmp/terraform` directory, and run the following:
```bash
> cd /tmp/terraform
> source <openstack-tenancy-file>
> sh keys.sh
```
Now execute the main script for deploying the infra located in `/tmp/`:
```bash
> sh run_dev.sh

```
You can destroy the resources using:
```bash
> sh destroy_dev.sh

```

> **Tip:** You can run `terraform init` and subsequently check your setup with `terraform plan --var-file=localconf.tfvars
--var-file=ipnett.tfvars`. It is possible to bring up the bare machines with
`terraform apply --var-file=localconf.tfvars
--var-file=ipnett.tfvars`. The job prints out an ansible inventory at
the end.
