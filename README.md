PaaS 2 kubernetes platform
==========================

This repository contains scripts and ansible playbooks for managing the PaaS 2 kubernetes platform.

## Bringing up a test cluster
 
Before firing up the Kubernetes cluster, you need to login to the Vagrant box:
```bash
> vagrant up --provision
> vagrant ssh
```

Then, generate a RSA key-pair and setup your conda environment by first navigating to `setup`:
```bash
> cd setup
> ./keys.sh
> ./conda-env.sh
```

and source your Openstack tenancy file:
```bash
> source <openstack-tenancy-file>
```
Now execute the main script for deploying the infra located in `/home/vagrant`:
```bash
> cd ..
> ./run_dev.sh

```

In the folder `extras`, it is possible to find a simple nginx web service that you can easily deploy:
You can destroy the resources using:
```bash
> kubectl apply -f extras/nginx-example/nginx.yaml
```

> **Tip:** You can view the nginx web service by first adding an entry to your `/etc/hosts` file:
```bash
> echo '<lb-floating-ip nginx.example.com>' | sudo tee -a /etc/hosts

```

> **Note:** You can login to the machines via `ssh core@<ip-address> -i /home/vagrant/.ssh/id_rsa`
> **Note (ii):** You can destroy the resources using:
```bash
> ./destroy_dev.sh
```
