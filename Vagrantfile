
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  ############## Ci server vm
  config.vm.define "integration-server" do |subconfig|
    subconfig.vm.box = "ubuntu/jammy64"
    subconfig.vm.hostname = "integration-server"
    subconfig.vm.box_download_insecure = false 
  
    ENV['LC_ALL']="en_US.UTF-8"
  
    subconfig.vm.network "forwarded_port", guest: 8088, host: 8080
    subconfig.vm.network :private_network, ip: "192.168.56.9"

    subconfig.vm.synced_folder "./ci-server/data", "/vagrant_data"

    subconfig.vm.provider :virtualbox do |vb|
      vb.customize [
        'modifyvm', :id,
        '--natdnshostresolver1', 'on',
        '--memory', '5120',
        '--cpus', '4'
      ]
    
    end  
  
    subconfig.vm.provision "shell", inline: <<-SHELL
     	  sudo apt-get update
     	 
   	  SHELL
   
    subconfig.vm.provision "ansible" do |ansible|
    	ansible.playbook = "./ci-server/playbook/playbook.yml"
    end
  end
  
  ############## Registry-vm
  config.vm.define "registry-vm" do |subconfig|
    subconfig.vm.box = "ubuntu/jammy64"
    subconfig.vm.hostname = "registry-vm"
    subconfig.vm.box_download_insecure = false 
  
    ENV['LC_ALL']="en_US.UTF-8"
  
    subconfig.vm.network "forwarded_port", guest: 5000, host: 8088, host_ip: "192.168.33.8"
    subconfig.vm.network :private_network, ip: "192.168.33.8"

    subconfig.vm.synced_folder "./registry-vm/data", "/vagrant_data"

    subconfig.vm.provider :virtualbox do |vb|
      vb.customize [
        'modifyvm', :id,
        '--natdnshostresolver1', 'on',
        '--memory', '3072',
        '--cpus', '2'
      ]
    
    end  
  
    subconfig.vm.provision "shell", inline: <<-SHELL
     	  sudo apt-get update
     	  sudo apt-get install -y apache2

   	  SHELL
   
    subconfig.vm.provision "ansible" do |ansible|
    	ansible.playbook = "./registry-vm/playbook/playbook.yml"
    end
  end
end
