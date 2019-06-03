#!/bin/bash

echo "================================"

systemctl status ntpd sshd snmpd

echo "================================"

sudo yum install -y cowsay
yum info cowsay

echo "================================"

journalctl -n 10 --no-pager


