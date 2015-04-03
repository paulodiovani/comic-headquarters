# -*- mode: ruby -*-
# vi: set ft=ruby :

# set Docker as default provider
if ENV['VAGRANT_DEFAULT_PROVIDER'].nil?
  ENV['VAGRANT_DEFAULT_PROVIDER'] = "docker"
end

Vagrant.configure(2) do |config|
  # Docker provider
  config.vm.provider 'docker' do |d|
    d.image   = 'mongo'
    d.name    = 'comic-hq-mongodb'
    d.expose  = [ 27017 ]
    d.ports   = [ '27017:27017' ]
  end

  # Disable default synced folder
  config.vm.synced_folder '.', '/vagrant', disabled: true
end
