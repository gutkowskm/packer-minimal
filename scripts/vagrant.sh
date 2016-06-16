mkdir -pm 700 /home/centos/.ssh
curl -L https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -o /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/centos/.ssh/authorized_keys
chown -R centos:centos /home/vagrant/.ssh
