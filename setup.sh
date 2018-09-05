#!/bin/bash -eu

yum install -y unzip vim python2-pip nc

# install conda
curl -L -o /tmp/miniconda.sh https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
chmod +x /tmp/miniconda.sh
sh /tmp/miniconda.sh -u -b -p /opt/miniconda
cat >> /home/vagrant/.bashrc << END
export PATH=/opt/miniconda/bin:$PATH
END
