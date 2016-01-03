Vagrant.configure(2) do |config|
  
  config.vm.box = "ubuntu/trusty64"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.81"

  config.vm.synced_folder "./", "/vagrant", id: "vagrant-root",
  owner: "vagrant",
  group: "www-data",
  mount_options: ["dmode=775,fmode=664"]
  
  config.vm.provision :shell, :path => "bootstrap.sh"

end
