#!/usr/bin/env bash

VBOX_VERSION="$(cat /home/vagrant/.vbox_version)"

mkdir -p /tmp/vbox
mount -o loop -t iso9660 "/home/vagrant/VBoxGuestAdditions_${VBOX_VERSION}.iso" /tmp/vbox

# fix Debian wheezy based systems
if grep -q 'Debian GNU/Linux 7' /etc/os-release; then
    strip -R .note.ABI-tag /usr/lib/x86_64-linux-gnu/libGL.so.1
    ldconfig
    sh /tmp/vbox/VBoxLinuxAdditions.run <<< "yes"
else
    sh /tmp/vbox/VBoxLinuxAdditions.run
fi

sudo umount /tmp/vbox
rm -rf /tmp/vbox "/home/vagrant/VBoxGuestAdditions_${VBOX_VERSION}.iso"
