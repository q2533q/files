#!/bin/sh

cd /root/
rm -rf x-ui/ /usr/local/x-ui/ /usr/bin/x-ui
wget https://cdn.jsdelivr.net/gh/q2533q/files/x-ui/x-ui-linux-amd64.tar.gz
tar zxvf x-ui-linux-amd64.tar.gz
chmod +x x-ui/x-ui x-ui/bin/xray-linux-* x-ui/x-ui.sh
cp x-ui/x-ui.sh /usr/bin/x-ui
cp -f x-ui/x-ui.service /etc/systemd/system/
mv x-ui/ /usr/local/
systemctl daemon-reload
systemctl enable x-ui
systemctl restart x-ui
