#! /bin/bash
 
# Zeit und Benutzer Managment
timedatectl set-timezone Europe/Berlin
userdel -r vagrant
useradd -c "NETWAYS Training" -p `openssl passwd  -1 netways` training
 
if [ -f /etc/sudoers.d/vagrant ]; then
  rm /etc/sudoers.d/vagrant
fi
 
echo "%training ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/training
echo -e 'Username: training\nPassword: netways\n\n' >> /etc/issue
echo -e '192.168.56.101 \t puppet.localdomain\n192.168.56.102 \t agent-centos.localdomain\n192.168.56.103 \t agent-debian.localdomain' >> /etc/hosts
localectl set-keymap de
echo -e 'netways\nnetways' | passwd
 
# Installation
rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
yum -y install vim-enhanced  puppetserver  bash-completion openssh-server  openssh-clients  git
sed -i 's/2g/768m/g' /etc/sysconfig/puppetserver
yum -y install ruby epel-release
yum -y install rubygem-puppet-lint
 
systemctl enable puppetserver --now
source /etc/profile.d/bash_completion.sh
 
# git Konfiguieren
useradd -c "NETWAYS Git" -p `openssl passwd  -1 netways` git
echo -e 'Username: git\n Password: netways\n' >> /etc/issue
usermod -a -G puppet git
su - git -c " git --bare init puppet.git "
su - git -c "git clone https://github.com/adrienthebo/puppet-git-hooks.git puppet-deployment-hooks"
su - git -c "git clone https://github.com/drwahl/puppet-git-hooks.git puppet-validation-hooks "
ln -s /home/git/puppet-deployment-hooks/post-receive/dynamic-environments /home/git/puppet.git/hooks/post-receive
sed -i 's_/etc/puppet/environments_/etc/puppetlabs/code/environments_g' /home/git/puppet-deployment-hooks/post-receive/dynamic-environments
sed -i 's%# "master" => "development%"master" => "production%g' /home/git/puppet-deployment-hooks/post-receive/dynamic-environments
ln -s /home/git/puppet-validation-hooks/pre-receive /home/git/puppet.git/hooks/pre-receive
sed -i '1 s/enabled/permissive/' /home/git/puppet-validation-hooks/commit_hooks/config.cfg
rm -rf /etc/puppetlabs/code/environments/production/
git clone /home/git/puppet.git /etc/puppetlabs/code/environments/production/
chown -R git:puppet  /etc/puppetlabs/code/environments
