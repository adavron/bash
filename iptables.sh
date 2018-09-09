#!/bin/bash
echo "Please enter which port you want to have open: "
read openport
iptables -A INPUT -m state --state NEW -m udp -p udp --dport $openport -j ACCEPT
service iptables restart
sleep 5
echo "The port $openport is enabled for you"
