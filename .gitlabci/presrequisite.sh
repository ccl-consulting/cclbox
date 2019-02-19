#!/bin/bash
# Install RHEL Repo Files
sudo yum install -y epel-release
# Update latest packages
sudo yum update -y
# Install wget
sudo yum install -y wget
# Go on working_directory
cd /home/bot_actinium/gcp/
# Install following dependency packages
sudo yum group install -y "Development Tools"
# Install following dependency packages
sudo yum -y install qemu-kvm libvirt virt-install bridge-utils libvirt-devel  libxslt-devel libxml2-devel libvirt-devel libguestfs-tools-c
# Authorize Ip Forwarding
sudo  echo "net.ipv4.ip_forward = 1"|sudo tee /etc/sysctl.d/99-ipforward.conf
sudo sysctl -p /etc/sysctl.d/99-ipforward.conf
# Start Libvirt
sudo systemctl start libvirtd
# Download Vagrant RPM
wget https://releases.hashicorp.com/vagrant/2.2.3/vagrant_2.2.3_x86_64.rpm
# Install Vagrant RPM
sudo yum -y install ./vagrant_2.2.3_x86_64.rpm
# Install vagrant libvirt/kvm plugin
vagrant plugin install vagrant-libvirt
# Install git
sudo yum install -y git unzip
# Downloads Packer
wget https://releases.hashicorp.com/packer/1.3.4/packer_1.3.4_linux_amd64.zip
# Install Packer
unzip packer_1.3.2_linux_amd64.zip
# Executable packer
chmod 755 packer
# Give rights to bot_actinium
chown -Rf bot-cclbox:bot-cclbox *
