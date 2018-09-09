#!/bin/bash
# make a tempdir and cd to it with this code in a file
# make a file with all the IPs you need in the tempdir
# runThisFIle < ipAddressFIle

set -vx

# Put your UNIX username in here:
export username=

cat - |
while read ipaddr
do

srv=$(nc -dnvw1 $ipaddr 22 2>&1)

# Linux Hosts
echo $srv | grep -q OpenSSH && 
{
echo Testing Unix Box
ssh -q -n -o StrictHostkeyChecking=no -o GlobalKnownHostsFile=/dev/null -o UserKnownHostsFile=/dev/null $username@$ipaddr 'uname -n; /sbin/ip -o -4 a l'
} > $ipaddr

# Windows Hosts
echo $srv | grep -q PowerShell && 
{
echo Testing Windows Box
ssh -q -n -o StrictHostkeyChecking=no -o GlobalKnownHostsFile=/dev/null -o UserKnownHostsFile=/dev/null ipautomata@$ipaddr 'hostname ; ipconfig ; get-item wsman:\localhost\shell\maxshellsperuser ; get-item wsman:\localhost\shell\MaxConcurrentUsers'
} > $ipaddr

done 
