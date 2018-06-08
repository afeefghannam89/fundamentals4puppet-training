# -*- mode: ruby -*-
# vi: set ft=ruby :
 
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
 
  config.vm.define "puppet1" do |puppet1|                         # Hier definieren wir das erste VM
    puppet1.vm.box = "bento/centos-7.4"                           # Hier haben wir bento als Ausgabe von centos, da sie die Möglichkeit zur Verfügung stellt, vagrant sich als root per ssh              
    puppet1.vm.hostname = "puppet.localdomain"                    # anzumelden.Damit haben wir nicht nur Root-richte, sondern auch können wir Vagrantbenutzer löschen.                            
    puppet1.vm.provision :shell, :path => "/home/training/vagrant-neu/puppet-master-sript.sh"   
    puppet1.ssh.username = "root"
    puppet1.ssh.password = "vagrant"
    puppet1.ssh.insert_key = "true"
    puppet1.vm.network "private_network", ip: "192.168.56.101"     # Hier stellen wir die Horst-only-Netzwerk ein
     
    puppet1.vm.provider "virtualbox" do |vb|
      vb.name = "puppet.localdomain"
      vb.customize ["modifyvm", :id, "--memory", "1536"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
  config.vm.define "puppet2" do |puppet2|
    puppet2.vm.box = "bento/centos-7.4"
    puppet2.vm.hostname = "agent-centos.localdomain"
    puppet2.vm.provision :shell, :path => "/home/training/vagrant-neu/agent-centos-script.sh"
    puppet2.vm.provision :shell, :path => "/home/training/vagrant-neu/ssh.sh"
    puppet2.vm.provision :shell, :path => "/home/training/vagrant-neu/agent-centos-script2.sh"
    puppet2.ssh.username = "root"
    puppet2.ssh.password = "vagrant"
    puppet2.ssh.insert_key = "true"
    puppet2.vm.network "private_network", ip: "192.168.56.102"
 
    puppet2.vm.provider "virtualbox" do |vb|
      vb.name = "agent-centos.localdomain"
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
config.vm.define "puppet3" do |puppet3|
    puppet3.vm.box = "bento/debian-8.7"
    puppet3.vm.hostname = "agent-debian.localdomain"
    puppet3.vm.provision :shell, :path => "/home/training/vagrant-neu/agent-debian-script.sh"
#   puppet3.vm.provision :shell, :path => "/home/training/vagrant-neu/ssh.sh"
    puppet3.ssh.username = "vagrant"
    puppet3.ssh.password = "vagrant"
    puppet3.ssh.insert_key = "true"
    puppet3.vm.network "private_network", ip: "192.168.56.103"
 
    puppet3.vm.provider "virtualbox" do |vb|
      vb.name = "agent-debian.localdomain"
      vb.customize ["modifyvm", :id, "--memory", "768"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
 
end
