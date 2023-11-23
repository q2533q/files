
#打开novnc的GUI界面
#浏览器下载WIN10系统镜像
https://software.download.prss.microsoft.com/dbazure/Win10_22H2_Chinese_Simplified_x64v1.iso?t=656b59ae-04f1-4003-a8c7-e77900aa21d5&e=1700789401&h=78bda65bdb6f507b989b9aadf0c9e47478ebe6b2885f618e54c8d40220bb3286

#运行命令, 安装WIN10虚拟机
sudo apt install -y qemu-kvm
sudo qemu-img create -f qcow2 /home/ubuntu/Downloads/win10 60G
sudo chmod 777 /home/ubuntu/Downloads/win10
#配置4核4G,给太高容易被封号
kvm /home/ubuntu/Downloads/win10 -m 4096 -smp cores=4 -net user -net nic -usb -usbdevice tablet -cdrom /home/ubuntu/Downloads/Win10_22H2_Chinese_Simplified_x64v1.iso
