#!/bin/bash
# Check if .ssh directory exists
if [ ! -d "/home/vagrant/.ssh" ]; then
  mkdir -p /home/vagrant/.ssh
fi

# Generate SSH keys if they don't exist
if [ ! -f "/home/vagrant/.ssh/id_rsa" ]; then
  ssh-keygen -t rsa -N "" -f "/home/vagrant/.ssh/id_rsa"
fi

# Copy the SSH keys to authorized_keys to enable passwordless SSH
cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

# Correct permissions
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh