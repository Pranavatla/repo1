# -*- mode: ruby -*-
# vi: set ft=ruby :

# Common provisioning script to set up SSH keys
$setup_ssh_keys = <<-SCRIPT
  if [ ! -f /home/vagrant/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -N ''
  fi
  cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
  chmod 700 /home/vagrant/.ssh
  chmod 600 /home/vagrant/.ssh/authorized_keys
SCRIPT

Vagrant.configure("2") do |config|

  # Define the common configuration for all VMs
  config.vm.define "vm1" do |vm1|
    vm1.vm.box = "ubuntu/bionic64"
    vm1.vm.network "private_network", ip: "192.168.56.5"
    vm1.vm.provision "shell", inline: $setup_ssh_keys
    vm1.vm.provision "shell", path: "provision_vm1.sh"
    vm1.vm.provision "shell", path: "provision.sh"
  end

  config.vm.define "vm2" do |vm2|
    vm2.vm.box = "ubuntu/bionic64"
    vm2.vm.network "private_network", ip: "192.168.56.6"
    vm2.vm.provision "shell", inline: $setup_ssh_keys
    vm2.vm.provision "shell", path: "provision_vm2.sh"
    vm2.vm.provision "shell", path: "provision.sh"
  end

  # Different Box for third VM
  config.vm.define "vm3" do |vm3|
    vm3.vm.box = "centos/8"
    vm3.vm.network "private_network", ip: "192.168.56.7"
    vm3.vm.provision "shell", inline: $setup_ssh_keys
    vm3.vm.provision "shell", path: "provision_vm3.sh"
    vm3.vm.provision "shell", path: "provision.sh"
  end
end