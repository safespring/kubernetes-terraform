# -*- mode: ruby -*-
# vi: set ft=ruby :

projectroot = File.dirname(__FILE__)

Vagrant.configure("2") do |config|
  config.vm.box = "safespring/centos"
  ENV['LC_ALL']="en_US.UTF-8"
  config.vm.provision "file", source: projectroot + "/terraform", destination: "~/terraform"
  config.vm.provision "file", source: projectroot + "/run_dev.sh", destination: "~/run_dev.sh"
  config.vm.provision "file", source: projectroot + "/destroy_dev.sh", destination: "~/destroy_dev.sh"
  config.vm.provision "file", source: projectroot + "/ansible", destination: "~/ansible"
  config.vm.provision "file", source: projectroot + "/setup", destination: "~/setup"
  config.vm.provision "file", source: projectroot + "/tests", destination: "~/tests"
  config.vm.provision "file", source: projectroot + "/extras", destination: "~/extras"
  config.vm.provision "shell", path: "setup.sh"
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true
end
