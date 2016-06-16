
Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.ssh.username = "centos"
  config.ssh.forward_agent = true
  config.vm.box = "gutkowskim/centos-7.1-minimal-14-06.16" 
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", 1024]
  end
end
