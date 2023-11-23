https://www.microsoft.com/zh-cn/software-download/windows10ISO

https://software.download.prss.microsoft.com/dbazure/Win10_22H2_Chinese_Simplified_x64v1.iso?t=656b59ae-04f1-4003-a8c7-e77900aa21d5&e=1700789401&h=78bda65bdb6f507b989b9aadf0c9e47478ebe6b2885f618e54c8d40220bb3286

sudo -i
echo root:'aA123456' | chpasswd root
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
service sshd restart
npm install -g wstunnel
wstunnel -s :8090 &

apt install -y qemu-kvm

qemu-img create -f qcow2 /home/ubuntu/Downloads/win10 60G

chmod 777 /home/ubuntu/Downloads/win10

echo 3 > /proc/sys/vm/drop_caches

exit
kvm /home/ubuntu/Downloads/win10 -m 10240 -smp cores=6 -net user -net nic -usb -usbdevice tablet -cdrom /home/ubuntu/Downloads/Win10_22H2_Chinese_Simplified_x64v1.iso
