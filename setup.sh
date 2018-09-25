#!/bin/bash -eu
sudo yum groupinstall -y "Development Tools"
sudo yum install -y unzip

# install terraform
mkdir -p ~/bin
curl -LC - -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip
unzip -oq /tmp/terraform.zip -d /usr/local/bin

# install kubectl
curl -LC - -o /tmp/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.10.0/bin/linux/amd64/kubectl
chmod +x /tmp/kubectl
mv /tmp/kubectl /usr/local/bin/kubectl

# change scripts privileges
chmod +x /home/vagrant/setup/keys.sh
chmod +x /home/vagrant/setup/conda-env.sh

# install conda
curl -L -o /tmp/miniconda.sh https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
chmod +x /tmp/miniconda.sh
sh /tmp/miniconda.sh -u -b -p /opt/miniconda
cat >> /home/vagrant/.bashrc << END
export PATH=/usr/local/bin:/opt/miniconda/bin:$PATH
END

# windows fix
find . -name '*.sh*' -exec chmod 755 {} +