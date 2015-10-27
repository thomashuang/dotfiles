Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  #config.vm.box_url = "pathToFile/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  #config.vm.network "public_network"
  config.vm.hostname = "Solo"
  config.vm.network "forwarded_port", guest: 3306, host: 3306   # mysql
  
  config.vm.boot_timeout = 300
  config.vm. graceful_halt_timeout = 60

  config.vm.synced_folder ".", "/vagrant", type: "rsync",
	rsync__exclude: ".git/"

  config.vm.provider "virtualbox" do |v|
	v.memory = 512
	# v.cpus = 2 # Number of CPUs
   end
end
