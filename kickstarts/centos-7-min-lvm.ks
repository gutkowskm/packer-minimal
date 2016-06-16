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

part swap --fstype swap --recommended
part /boot --fstype ext4 --size=100
part pv.01 --size 8000
volgroup myvg pv.01  
logvol / --vgname=myvg --fstype ext4 --size=1500 --name=rootvol
logvol /var --vgname=myvg --fstype ext4 --size=2500 --name=varvol
logvol /usr --vgname=myvg --fstype ext4 --size=2500 --name=usrvol
logvol /opt --vgname=myvg --fstype ext4 --size=500 --name=optvol
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
