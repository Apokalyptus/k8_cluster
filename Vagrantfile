# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  
  config.vm.provider "virtualbox" do |v|
#    v.name = "k8node"
    v.memory = 2048
  end

  config.vm.box = "rockylinux/8"
  config.vm.box_version = "4.0.0"
  

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  if ENV['http_proxy']
     config.vm.network "public_network", bridge: "wlp0s20f3", 
     use_dhcp_assigned_default_route: true
    
     if Vagrant.has_plugin?("vagrant-proxyconf")
        config.proxy.http     = ENV['http_proxy']
        config.proxy.https    = ENV['http_proxy']
        config.proxy.no_proxy = "localhost,127.0.0.1,.k8-cluster-test.com"
     end
  end

  config.vm.define "k8_master_01" do |k8_master_01|
    k8_master_01.vm.box = "rockylinux/8"
    k8_master_01.vm.box_version = "4.0.0"
    k8_master_01.vm.provider "virtualbox" do |vb|
      vb.name = "k8_master_01"
    end
    #k8_master_01.vm.network "forwarded_port", guest: 8080, host: 8888
    k8_master_01.vm.network "private_network", ip: "10.2.2.2"
    #Workaround to enable Password for SSH for KEY transfer
    k8_master_01.vm.provision "shell", inline: <<-SHELL
     sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
     systemctl restart sshd.service
     echo root:rocky | chpasswd
    SHELL
  end

  config.vm.define "k8_worker_01" do |k8_worker_01|
    k8_worker_01.vm.box = "rockylinux/8"
    k8_worker_01.vm.box_version = "4.0.0"
    k8_worker_01.vm.provider "virtualbox" do |vb|
      vb.name = "k8_worker_01"
    end
    #k8_worker_01.vm.network "forwarded_port", guest: 8080, host: 8888
    k8_worker_01.vm.network "private_network", ip: "10.2.2.3"
    k8_worker_01.vm.provision "shell", inline: <<-SHELL
     sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
     systemctl restart sshd.service
     echo root:rocky | chpasswd
    SHELL
  end
  
  config.vm.define "k8_worker_02" do |k8_worker_02|
    k8_worker_02.vm.box = "rockylinux/8"
    k8_worker_02.vm.box_version = "4.0.0"
    k8_worker_02.vm.provider "virtualbox" do |vb|
      vb.name = "k8_worker_02"
    end
    #k8_worker_02.vm.network "forwarded_port", guest: 8080, host: 8888
    k8_worker_02.vm.network "private_network", ip: "10.2.2.4"
    k8_worker_02.vm.provision "shell", inline: <<-SHELL
     sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
     systemctl restart sshd.service
     echo root:rocky | chpasswd
    SHELL
  end

end
