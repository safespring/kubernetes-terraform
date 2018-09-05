# -*- mode: ruby -*-
# vi: set ft=ruby :

projectroot = File.dirname(__FILE__)

Vagrant.configure("2") do |config|
  config.vm.box = "safespring/centos"
  ENV['LC_ALL']="en_US.UTF-8"
  config.vm.provision "file", source: projectroot + "/terraform", destination: "/tmp/terraform"
  config.vm.provision "file", source: projectroot + "/ansible", destination: "/tmp/ansible"
  config.vm.provision "file", source: projectroot + "/tests", destination: "/tmp/tests"
  config.vm.provision "shell", path: "setup.sh"
  config.vm.synced_folder ".", "/vagrant", disabled: true
end
