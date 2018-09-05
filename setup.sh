#!/bin/bash -eu

yum install -y unzip vim python2-pip nc

# install terraform
mkdir -p ~/bin
curl -LC - -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip
unzip -oq /tmp/terraform.zip -d /usr/local/bin

# install conda
curl -L -o /tmp/miniconda.sh https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
chmod +x /tmp/miniconda.sh
sh /tmp/miniconda.sh -u -b -p /opt/miniconda
cat >> /home/vagrant/.bashrc << END
export PATH=/usr/local/bin:/opt/miniconda/bin:$PATH
END