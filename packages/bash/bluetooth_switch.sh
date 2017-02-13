#!/bin/bash

echo "Restarting Bluetooth"
sudo systemctl restart bluetooth

#Connect/Disconnect Bluetooth Device
#This should be something like E9:08:F0:C0:5E:2A
bluetooth_id=`echo devices|bluetoothctl 2>/dev/null| grep ^Device |gawk -F" " '{print $2}'`
echo Bluetooth Device ID: $bluetooth_id
echo "Connecting to $bluetooth_id"
echo disconnect $bluetooth_id | bluetoothctl 2>/dev/null > /dev/null
sleep 5
echo connect $bluetooth_id | bluetoothctl 2>/dev/null > /dev/null
sleep 5
echo "Probably done"

#Set A2DP_SINK mode
index=`pacmd list-cards | grep bluez_card -B1 | grep index | awk '{print $2}'`
echo Bluetooth Card Index: $index
pacmd set-card-profile $index off
pacmd set-card-profile $index a2dp_sink

sink_name=`pacmd list-sinks |grep bluez_sink |gawk -F"<|>" '{print $2}'`
pacmd set-default-sink $sink_name

if [ ! -z $1 ]; then
	exit
fi


#Somehow second execution always works!!! So repeat everything

echo "Restarting Bluetooth"
sudo systemctl restart bluetooth

#Connect/Disconnect Bluetooth Device
#This should be something like E9:08:F0:C0:5E:2A
bluetooth_id=`echo devices|bluetoothctl 2>/dev/null| grep ^Device |gawk -F" " '{print $2}'`
echo Bluetooth Device ID: $bluetooth_id
echo "Connecting to $bluetooth_id"
echo disconnect $bluetooth_id | bluetoothctl 2>/dev/null > /dev/null
sleep 5
echo connect $bluetooth_id | bluetoothctl 2>/dev/null > /dev/null
sleep 5
echo "Probably done"

#Set A2DP_SINK mode
index=`pacmd list-cards | grep bluez_card -B1 | grep index | awk '{print $2}'`
echo Bluetooth Card Index: $index
pacmd set-card-profile $index off
pacmd set-card-profile $index a2dp_sink

sink_name=`pacmd list-sinks |grep bluez_sink |gawk -F"<|>" '{print $2}'`
pacmd set-default-sink $sink_name
