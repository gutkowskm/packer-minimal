mkdir -pm 700 /home/centos/.ssh

touch /home/centos/.ssh/authorized_keys

chmod 0600 /home/centos/.ssh/authorized_keys
chown -R centos:centos /home/centos/.ssh
