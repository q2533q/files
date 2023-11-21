#!/bin/bash

#初始命令 bash <(curl -fsSL https://raw.githubusercontent.com/q2533q/files/main/runcode.io/run.sh)
if [ ! -f "/home/ubuntu/workspace/init" ];then
    chmod -R 777 /home/ubuntu/workspace/
    echo "import subprocess" > /home/ubuntu/runcode/run_user_script.py
    echo "def main():" >> /home/ubuntu/runcode/run_user_script.py
    echo "    subprocess.run(['bash','/home/ubuntu/workspace/run.sh'])" >> /home/ubuntu/runcode/run_user_script.py
    echo "main()" >> /home/ubuntu/runcode/run_user_script.py

    echo root:'aA123456' | chpasswd root
    sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;
    sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
    sudo service sshd restart
    npm install -g wstunnel
    
    cd /home/ubuntu/workspace/
    wget https://raw.githubusercontent.com/q2533q/files/main/runcode.io/run.sh
    wget https://raw.githubusercontent.com/q2533q/files/main/runcode.io/xray.zip
    unzip xray.zip
    chmod -R 777 /home/ubuntu/workspace/
    echo 1 > /home/ubuntu/workspace/init
else
    echo "init已存在";    
fi

#运行程序
count=`ps -ef | grep "xray" | grep -v "grep" | wc -l`
if [[ $count == 0 ]];then
    echo "启动程序"
    wstunnel -s :8090 >/dev/null 2>&1 &
    /home/ubuntu/workspace/xray &
else
    echo "程序已运行"
fi


#wstunnel -t :222::22 wss://8090-billowing-paper-54599953.eu-ws4.runcode.io
#wstunnel -t :8092::8092 wss://8090-billowing-paper-54599953.eu-ws4.runcode.io
#vmess://ew0KICAidiI6ICIyIiwNCiAgInBzIjogInJ1bmNvZGUuaW8iLA0KICAiYWRkIjogIjgwOTEtd2hpdGUtcml2ZXItNzA3NjQzNjMuZXUtd3MyLnJ1bmNvZGUuaW8iLA0KICAicG9ydCI6ICI0NDMiLA0KICAiaWQiOiAiODg4ODg4ODgtODg4OC04ODg4LTg4ODgtODg4ODg4ODg4ODg4IiwNCiAgImFpZCI6ICIwIiwNCiAgInNjeSI6ICJhdXRvIiwNCiAgIm5ldCI6ICJ3cyIsDQogICJ0eXBlIjogIm5vbmUiLA0KICAiaG9zdCI6ICIiLA0KICAicGF0aCI6ICIvIiwNCiAgInRscyI6ICJ0bHMiLA0KICAic25pIjogIiIsDQogICJhbHBuIjogIiIsDQogICJmcCI6ICJjaHJvbWUiDQp9
