mount -o loop /home/centos/VBoxGuestAdditions_5.0.14.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/centos/VBoxGuestAdditions_5.0.14.iso
