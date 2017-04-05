#!/usr/bin/env bash

VBOX_VERSION="$(cat /home/vagrant/.vbox_version)"

mkdir -p /tmp/vbox
sudo mount -o loop -t iso9660 "/home/vagrant/VBoxGuestAdditions_${VBOX_VERSION}.iso" /tmp/vbox

sudo sh /tmp/vbox/VBoxLinuxAdditions.run

sudo umount /tmp/vbox
rm -rf /tmp/vbox "/home/vagrant/VBoxGuestAdditions_${VBOX_VERSION}.iso"
