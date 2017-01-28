#!/bin/bash

#Kill and restart Puls
pulseaudio -k
sleep 1

#Connect/Disconnect Bluetooth Device
bluetooth_id=`echo devices|bluetoothctl 2>/dev/null| grep ^Device |gawk -F" " '{print $2}'`
#This should be something like E9:08:F0:C0:5E:2A
echo Bluetooth Device ID: $bluetooth_id \(This should be something like E9:08:F0:C0:5E:2A\)
echo disconnect $bluetooth_id | bluetoothctl 2> /dev/null > /dev/null
sleep 5
echo connect $bluetooth_id | bluetoothctl 2> /dev/null > /dev/null
sleep 10

#Set A2DP_SINK mode
index=`pacmd list-cards | grep bluez_card -B1 | grep index | awk '{print $2}'`
echo Bluetooth Card Index: $index
pacmd set-card-profile $index off
sleep 1
pacmd set-card-profile $index a2dp_sink

#Set default SINK to bluez
sink_name=`pacmd list-cards |grep bluez -B1 |grep sinks -A1 |grep -v "sinks:" |gawk -F"/" '{ print $1 }'`
pacmd set-default-sink $sink_name

echo ""
echo "____If this does not work, reboot your headset and run this script again____"
