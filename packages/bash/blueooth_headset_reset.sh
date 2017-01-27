#!/bin/bash

#Kill and restart Puls
pulseaudio -k
sleep 1

#Connect/Disconnect Bluetooth Device
bluetooth_id=E9:08:EF:D0:5F:1A
echo $bluetooth_id
echo disconnect $bluetooth_id | bluetoothctl
sleep 5
echo connect $bluetooth_id | bluetoothctl
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
