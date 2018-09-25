#!/bin/bash
PRIVATE_KEY=/home/vagrant/.ssh/id_rsa
if [ ! -f $PRIVATE_KEY ]; then
	mkdir -p /home/vagrant/.ssh
	chmod 700 /home/vagrant/.ssh
	ssh-keygen -t rsa -b 4096 -f /home/vagrant/.ssh/id_rsa -q -N ""
	chmod -R 600 /home/vagrant/.ssh/id_rsa
	cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
fi
eval "$(ssh-agent -s)"
ssh-add /home/vagrant/.ssh/id_rsa