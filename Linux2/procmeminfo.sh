#!/bin/bash

proc_meminfo="/proc/meminfo"

MemTotal=$(cat $proc_meminfo | grep '^MemTotal')
MemFree=$(cat $proc_meminfo | grep '^MemFree') 
MemAvailable=$(cat $proc_meminfo | grep '^MemAvailable') 
Active=$(cat $proc_meminfo | grep '^Active') 
Inactive=$(cat $proc_meminfo | grep '^Inactive') 
SwapTotal=$(cat $proc_meminfo | grep '^SwapTotal') 
SwapFree=$(cat $proc_meminfo | grep '^SwapFree') 


MemTotal=$(echo $MemTotal | cut -d ' ' -f 2,3)
MemFree=$(echo $MemFree | cut -d ' ' -f 2,3)
MemAvailable=$(echo $MemAvailable | cut -d ' ' -f 2,3)
Active=$(echo $Active| cut -d ' ' -f 2,3)
Inactive=$(echo $Inactive| cut -d ' ' -f 2,3)
SwapTotal=$(echo $SwapTotal| cut -d ' ' -f 2,3)
SwapFree=$(echo $SwapFree| cut -d ' ' -f 2,3)


echo "MemTotal: $MemTotal"
echo "MemFree: $MemFree"
echo "MemAvailable: $MemAvailable"
echo "Active: $Active"
echo "Inactive: $Inactive"
echo "SwapTotal: $SwapTotal"
echo "SwapFree: $SwapFree"
