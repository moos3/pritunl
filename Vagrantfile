# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.hostname = "pritunl-berkshelf"

  # Set the version of chef to install using the vagrant-omnibus plugin
  config.omnibus.chef_version = :latest

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "opscode_ubuntu-14.04_provisionerless"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"

  config.vm.network "forwarded_port", guest: 9700, host: 9700

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {}
    chef.add_recipe "pritunl::_common"
    chef.add_recipe "pritunl"
    #chef.log_level = :debug
  end
end
