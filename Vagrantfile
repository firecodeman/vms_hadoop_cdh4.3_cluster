# -*- mode: ruby -*-
# vi: set ft=ruby :

d_master_d1 = './disk/d_master_d1.vdi'
d_n1_d1 = './disk/d_n1_d1.vdi'
d_n2_d1 = './disk/d_n2_d1.vdi'
d_n3_d1 = './disk/d_n3_d1.vdi'
d_n4_d1 = './disk/d_n4_d1.vdi'
Vagrant.configure("2") do |config|
  config.vm.define :master do |master|
    master.vm.box = "precise64"
    master.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"]  = "4096"
    end
    master.vm.provider :virtualbox do |v|
      v.name = "vm-cluster-master"
      v.customize ["modifyvm", :id, "--memory", "1024"]
      v.customize ['createhd', '--filename', d_master_d1 , '--size', 1 * 1024]
      v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', d_master_d1]
#      v.customize ['createhd', '--filename', d_n1_d2 , '--size', 1 * 1024]
#      v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 2, '--device', 1, '--type', 'hdd', '--medium', d_n1_d2]
    end
 
    master.vm.network :private_network, ip: "10.211.55.100"
    master.vm.hostname = "vm-cluster-master"
    master.vm.provision :puppet, :module_path => "my_modules"
  end

  config.vm.define :slave1 do |slave1|
    slave1.vm.box = "precise64"
    slave1.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"]  = "5120"
    end
    slave1.vm.provider :virtualbox do |v|
      v.name = "vm-cluster-n1"
      v.customize ["modifyvm", :id, "--memory", "512"]
      v.customize ['createhd', '--filename', d_n1_d1 , '--size', 1 * 1024]
      v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', d_n1_d1]
    end
    slave1.vm.network :private_network, ip: "10.211.55.101"
    slave1.vm.hostname = "vm-cluster-n1"
    slave1.vm.provision :puppet, :module_path => "my_modules"
  end

  config.vm.define :slave2 do |slave2|
    slave2.vm.box = "precise64"
    slave2.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"]  = "5120"
    end
    slave2.vm.provider :virtualbox do |v|
      v.name = "vm-cluster-n2"
      v.customize ["modifyvm", :id, "--memory", "512"]
      v.customize ['createhd', '--filename', d_n2_d1 , '--size', 1 * 1024]
      v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', d_n2_d1]
    end
    slave2.vm.network :private_network, ip: "10.211.55.102"
    slave2.vm.hostname = "vm-cluster-n2"
    slave2.vm.provision :puppet, :module_path => "my_modules"
  end

  config.vm.define :slave3 do |slave3|
    slave3.vm.box = "precise64"
    slave3.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"]  = "5120"
    end
    slave3.vm.provider :virtualbox do |v|
      v.name = "vm-cluster-n3"
      v.customize ["modifyvm", :id, "--memory", "512"]
      v.customize ['createhd', '--filename', d_n3_d1 , '--size', 1 * 1024]
      v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', d_n3_d1]

    end
    slave3.vm.network :private_network, ip: "10.211.55.103"
    slave3.vm.hostname = "vm-cluster-n3"
    slave3.vm.provision :puppet, :module_path => "my_modules"
  end

  config.vm.define :slave4 do |slave4|
    slave4.vm.box = "precise64"
    slave4.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"]  = "5120"
    end
    slave4.vm.provider :virtualbox do |v|
      v.name = "vm-cluster-n4"
      v.customize ["modifyvm", :id, "--memory", "512"]
      v.customize ['createhd', '--filename', d_n4_d1 , '--size', 1 * 1024]
      v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', d_n4_d1]

    end
    slave4.vm.network :private_network, ip: "10.211.55.104"
    slave4.vm.hostname = "vm-cluster-n4"
    slave4.vm.provision :puppet, :module_path => "my_modules"
  end

  config.vm.define :client do |client|
    client.vm.box = "precise64"
    client.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"]  = "4096"
    end
    client.vm.provider :virtualbox do |v|
      v.name = "vm-cluster-cl"
      v.customize ["modifyvm", :id, "--memory", "512"]
    end
    client.vm.network :private_network, ip: "10.211.55.105"
    client.vm.hostname = "vm-cluster-cl"
    client.vm.provision :puppet, :module_path => "my_modules"
    #config.vm.provision :puppet_server do |puppet|
    #  puppet.puppet_server = "10.211.55.106"
    #end
  end

  config.vm.define :pp_master do |pp_master|
    pp_master.vm.box = "precise64"
    pp_master.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"]  = "4096"
    end
    pp_master.vm.provider :virtualbox do |v|
      v.name = "vm-cluster-ppm"
      v.customize ["modifyvm", :id, "--memory", "512"]
    end
    pp_master.vm.network :private_network, ip: "10.211.55.106"
    pp_master.vm.hostname = "vm-cluster-ppm"
    pp_master.vm.provision :puppet, :module_path => "my_modules"
  end

end
