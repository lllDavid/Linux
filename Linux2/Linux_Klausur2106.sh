#David Wagner
#!/bin/bash

os=$(uname)
kernelVersion=$(uname -r)
cpuName=$(lscpu | awk '/Intel/ {print  $5 $6 $7 $8 }')
cpuCores=$(nproc --all)
ram=$(grep MemTotal /proc/meminfo)
gpu=$(lspci -v -s $(lspci | grep ' VGA ' | cut -d" " -f 1))
festplatte=$(lsblk | awk '/sda3/ {print $0}')

echo "Computer Informationen"
echo "--------------------------"
echo "Das Betriebssystem ist:" $os
echo "--------------------------"
echo "Die Kernelversion ist:" $kernelVersion
echo "--------------------------"
echo "CPU Name:" $cpuName
echo "CPU Kerne:" $cpuCores
echo "--------------------------"
echo $ram
echo "--------------------------"
echo "GPU:" $gpu
echo "--------------------------"
echo "Festplatte:"$festplatte