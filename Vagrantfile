# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

  config.proxy.http = "http://web-proxy.corp.hp.com:8080"
  config.proxy.https = "http://web-proxy.corp.hp.com:8080"
  config.proxy.no_proxy = "localhost,127.0.0.1"

  config.vm.define "lb1" do |lb1|
	lb1.vm.box = "ubuntu/trusty64"
	lb1.vm.network "private_network" , ip: "10.0.0.10"
	lb1.vm.provision "shell", path: "lb_provision.sh"
  end

  config.vm.define "web1" do |web1|
	web1.vm.box = "ubuntu/trusty64"
	web1.vm.network "private_network", ip: "10.0.0.11"
	web1.vm.provision :shell do |shell|
		shell.args = "1"
		shell.path = "web_provision.sh"
	end
  end

  config.vm.define "web2" do |web2|
        web2.vm.box = "ubuntu/trusty64"
        web2.vm.network "private_network", ip: "10.0.0.12"
        web2.vm.provision :shell do |shell|
	        shell.args = "2"
	        shell.path = "web_provision.sh"
	end
  end

  config.vm.define "web3" do |web3|
        web3.vm.box = "ubuntu/trusty64"
	web3.vm.network "private_network", ip: "10.0.0.13"
	web3.vm.provision :shell do |shell|
		shell.args = "3"
		shell.path = "web_provision.sh"
	end
  end

  config.vm.define "web4" do |web4|
        web4.vm.box = "ubuntu/trusty64"
	web4.vm.network "private_network", ip: "10.0.0.14"
	web4.vm.provision :shell do |shell|
	        shell.args = "4"
	        shell.path = "web_provision.sh"
	end
  end
  
  config.vm.define "test-container" do |t|
	t.vm.provider :docker do |d|
		d.name = "ping-container"
		d.build_dir = "."
		d.cmd = ["ping","-c 51","127.0.0.1"]
		d.remains_running = true
		d.vagrant_machine ="web1"
#		d.vagrant_vagrantfile = "./DockerHostVagrantFile"
	end

  end


  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port m./apping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine ./appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push../app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
