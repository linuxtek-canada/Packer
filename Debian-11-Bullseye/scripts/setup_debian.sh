#!/bin/bash

echo '> Cleaning all audit logs ...'
if [ -f /var/log/audit/audit.log ]; then
cat /dev/null > /var/log/audit/audit.log
fi
if [ -f /var/log/wtmp ]; then
cat /dev/null > /var/log/wtmp
fi
if [ -f /var/log/lastlog ]; then
cat /dev/null > /var/log/lastlog
fi

# Cleans SSH keys.
echo '> Cleaning SSH keys ...'
rm -f /etc/ssh/ssh_host_*

#Generate a new SSH key for use with Terraform
echo '> Generating new SSH key ...'
ssh-keygen -A

#Enable SSHD to start on boot
echo '> Enabling sshd on startup ...'
systemctl enable sshd

# Sets hostname to localhost.
echo '> Setting hostname to localhost ...'
cat /dev/null > /etc/hostname
hostnamectl set-hostname localhost

# Remove lines in /etc/apt/sources.list for CDROM
echo '> Removing CDROM references from apt sources.list'
sed -i '/cdrom/d' /etc/apt/sources.list

# Perform apt update and apt upgrade
echo '> Performing apt update/upgrade'
apt update && apt -y upgrade

# Autoremove and cleans apt-get.
echo '> Cleaning apt-get ...'
apt-get autoremove && apt-get clean

# Cleans the machine-id.
echo '> Cleaning the machine-id ...'
truncate -s 0 /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id