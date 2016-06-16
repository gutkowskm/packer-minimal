install
cdrom

lang en_GB.UTF-8
keyboard us
timezone Europe/London

network --onboot yes --bootproto=dhcp --device=eth0 --activate --noipv6

rootpw Pa55w0rd!!
authconfig --enableshadow --passalgo=sha512
user --name=centos --groups=centos --password=C3nt05


firewall --enabled --service=ssh
selinux --disabled
firstboot --disabled

bootloader --location=mbr
text
skipx

logging --level=info
zerombr
clearpart --all --initlabel
autopart

reboot


%packages --nobase
@Core
openssh-clients
openssh-server
%end

%post --log=/root/post_install.log

# Add centos to sudoers
/bin/echo "centos        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/centos
/bin/chmod 0440 /etc/sudoers.d/centos
/bin/sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

%end
