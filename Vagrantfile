# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

  
  config.vm.define "web-server" do |h|
  
    h.vm.box = "ubuntu/mantic64"
    h.vm.provider :virtualbox
    h.vm.hostname = "devops1.mydemo.org"
    
    h.vm.synced_folder "./files", "/mnt/md127"

    h.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    h.vm.network "private_network", ip: "192.168.56.10"
  
    
    h.vm.provider "virtualbox" do |vb|
	    # Display the VirtualBox GUI when booting the machine
	     vb.gui = false
	     vb.name="Ubuntu mantic64 Vagrant"
	    # Customize the amount of memory on the VM:
	     vb.memory = "2048"
	     
	      unless File.exist?('./disk2.vdi')
		vb.customize ['createhd', '--filename', './disk2.vdi', '--variant', 'Fixed', '--size', 10 * 1024]
	      end
	      unless File.exist?('./disk3.vdi')
		vb.customize ['createhd', '--filename', './disk3.vdi', '--variant', 'Fixed', '--size', 10 * 1024]
	      end
	      unless File.exist?('./disk4.vdi')
		vb.customize ['createhd', '--filename', './disk4.vdi', '--variant', 'Fixed', '--size', 10 * 1024]
	      end
	      unless File.exist?('./disk5.vdi')
		vb.customize ['createhd', '--filename', './disk5.vdi', '--variant', 'Fixed', '--size', 10 * 1024]
	      end

	      vb.customize ['storageattach', :id,  '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', './disk2.vdi']
	      vb.customize ['storageattach', :id,  '--storagectl', 'SCSI', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', './disk3.vdi']
	      vb.customize ['storageattach', :id,  '--storagectl', 'SCSI', '--port', 4, '--device', 0, '--type', 'hdd', '--medium', './disk4.vdi']
	      vb.customize ['storageattach', :id,  '--storagectl', 'SCSI', '--port', 5, '--device', 0, '--type', 'hdd', '--medium', './disk5.vdi']
	     
   end #provider
   
    # Run only one time
    h.vm.provision "shell", path: "setup.sh"
   
   # run all time
   h.vm.provision "shell", run:"always", inline: <<-SHELL
     echo "Server statred"
   SHELL
    
  end #define
end#configure
