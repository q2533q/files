#!/bin/bash

#获取权限 sudo -i
#自动部署 bash <(curl -fsSL https://raw.githubusercontent.com/q2533q/files/main/runcode.io/run.sh)
if [ ! -f "/home/ubuntu/Downloads/init" ];then
    echo "import subprocess" > /home/ubuntu/runcode/run_user_script.py
    echo "def main():" >> /home/ubuntu/runcode/run_user_script.py
    echo "    subprocess.run(['bash','/home/ubuntu/Downloads/run.sh'])" >> /home/ubuntu/runcode/run_user_script.py
    echo "main()" >> /home/ubuntu/runcode/run_user_script.py

    echo root:'aA123456' | chpasswd root
    sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;
    sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
    service sshd restart
    npm install -g wstunnel
    
    cd /home/ubuntu/Downloads/
    wget https://raw.githubusercontent.com/q2533q/files/main/runcode.io/xray.zip
    unzip xray.zip
    rm xray.zip
    chmod -R 777 /home/ubuntu/Downloads/
    echo 1 > /home/ubuntu/Downloads/init
	
	apt install -y qemu-kvm && qemu-img create -f qcow2 /home/ubuntu/Downloads/win10 60G && chmod 777 /home/ubuntu/Downloads/win10
else
    echo "init已存在"; 
	top
fi

#运行程序
runid=`pidof xray`;
if [[ "$runid" = "" ]]; then
    echo "启动程序"
    wstunnel -s :8090 >/dev/null 2>&1 &
    /home/ubuntu/Downloads/xray &
else
    echo "程序已运行"
fi


#wstunnel -t :22::22 wss://8090-billowing-paper-54599953.eu-ws4.runcode.io
#wstunnel -t :8092::8092 wss://8090-billowing-paper-54599953.eu-ws4.runcode.io
#vmess://ew0KICAidiI6ICIyIiwNCiAgInBzIjogInJ1bmNvZGUuaW8iLA0KICAiYWRkIjogIjgwOTEtd2hpdGUtcml2ZXItNzA3NjQzNjMuZXUtd3MyLnJ1bmNvZGUuaW8iLA0KICAicG9ydCI6ICI0NDMiLA0KICAiaWQiOiAiODg4ODg4ODgtODg4OC04ODg4LTg4ODgtODg4ODg4ODg4ODg4IiwNCiAgImFpZCI6ICIwIiwNCiAgInNjeSI6ICJhdXRvIiwNCiAgIm5ldCI6ICJ3cyIsDQogICJ0eXBlIjogIm5vbmUiLA0KICAiaG9zdCI6ICIiLA0KICAicGF0aCI6ICIvIiwNCiAgInRscyI6ICJ0bHMiLA0KICAic25pIjogIiIsDQogICJhbHBuIjogIiIsDQogICJmcCI6ICJjaHJvbWUiDQp9


#下载系统镜像
# https://www.microsoft.com/zh-cn/software-download/windows10ISO
# https://software.download.prss.microsoft.com/dbazure/Win10_22H2_Chinese_Simplified_x64v1.iso?t=656b59ae-04f1-4003-a8c7-e77900aa21d5&e=1700789401&h=78bda65bdb6f507b989b9aadf0c9e47478ebe6b2885f618e54c8d40220bb3286
#运行WIN10
# kvm /home/ubuntu/Downloads/win10 -m 10240 -smp cores=6 -net user -net nic -usb -usbdevice tablet -cdrom /home/ubuntu/Downloads/Win10_22H2_Chinese_Simplified_x64v1.iso
