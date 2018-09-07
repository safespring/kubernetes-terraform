PaaS 2 kubernetes platform
==========================

This repository contains scripts and ansible playbooks for managing the PaaS 2 kubernetes platform.

## Bringing up a test cluster
 
Before firing up the Kubernetes cluster, you need to login to the Vagrant box:
```bash
> vagrant up --provision
> vagrant ssh
```
and source your Openstack tenancy file:
```bash
> source <openstack-tenancy-file>
```
Then, navigate to the `/tmp/terraform` directory, and generate a RSA key-pair:
```bash
> cd /tmp/terraform
> ./keys.sh
```
Now execute the main script for deploying the infra located in `/tmp/`:
```bash
> ./run_dev.sh

```
You can destroy the resources using:
```bash
> ./destroy_dev.sh

```

> **Tip 1:** You can login to the machines via `ssh core@<ip-address> -i /home/vagrant/.ssh/id_rsa`

> **Tip 2:** You can run `terraform init` and subsequently check your setup with `terraform plan --var-file=localconf.tfvars
--var-file=ipnett.tfvars`. It is possible to bring up the bare machines with
`terraform apply --var-file=localconf.tfvars
--var-file=ipnett.tfvars`. The job prints out an ansible inventory at
the end.
