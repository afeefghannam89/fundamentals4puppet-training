#! /bin/bash
 
# Benutzer Management
sudo -i
timedatectl set-timezone Europe/Berlin
useradd -c "NETWAYS Training" -p `openssl passwd  -1 netways` training
 
echo "%training ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/training
echo -e 'Username: training\nPassword: netways\n' >> /etc/issue
 
echo -e '192.168.56.101 \t puppet.localdomain\n192.168.56.102 \t agent-centos.localdomain\n192.168.56.103 \t agent-debian.localdomain' >> /etc/hosts
localectl set-keymap de
echo -e "netways\nnetways" | passwd
 
# installation
apt-get update
apt-get install -y  vim openssh-server expect bash-completion
source /etc/profile.d/bash_completion.sh
 
#puppet agent installation
 
wget https://apt.puppetlabs.com/puppet5-release-jessie.deb
dpkg -i puppet5-release-jessie.deb
apt-get install puppet-agent
