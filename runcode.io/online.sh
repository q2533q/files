#!/bin/bash

while true
do
  echo 3 > /proc/sys/vm/drop_caches
  /usr/bin/python3 /home/ubuntu/runcode/run_user_script.py
  sleep 300
done
