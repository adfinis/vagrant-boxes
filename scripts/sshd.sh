#!/usr/bin/env bash

sed -i 's/.*UseDNS.*/UseDNS no/g' /etc/ssh/sshd_config
mkdir -p /home/vagrant/.ssh
curl https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub > /home/vagrant/.ssh/authorized_keys
chmod 0700 /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant: /home/vagrant
