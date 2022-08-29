#!/bin/bash

###########################################################################
# Script Name:  mqtt_to_zabbix.sh
# Description:  MQTT subscriber to TTN and send the payload to Zabbix host.
# Author:       Agustin Ivorra
# Email:        agustinivorra@gmail.com
# Version:      1.0
###########################################################################

# Zabbix settings
zabbix_server="127.0.0.1";
zabbix_port=10051;
zabbix_itemkey="raw_ttn_v3";

# TTN settings
ttn_server="au1.cloud.thethings.network";
ttn_user=$(cat ./ttn.user);
ttn_pass=$(cat ./ttn.pass);
ttn_topics=("v3/$ttn_user/devices/+/up")

while :
do
  echo "Waitting a topic...";
  msg=$(mosquitto_sub -h $ttn_server -u $ttn_user -P $ttn_pass -v -C 1 -t $ttn_topics)
  topic=$(echo $msg | awk -F' ' {'print $1'})
  payload=$(echo $msg | awk -F' ' {'print $2'})
  zabbix_host=$(echo $topic | awk -F'/' {'print $4'})
  
  echo "Sending package to Zabbix server...";
  /usr/bin/zabbix_sender -z "$zabbix_server" -p "$zabbix_port" -s "$zabbix_host" -k "$zabbix_itemkey" -o "$payload"

done