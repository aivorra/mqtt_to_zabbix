# MQTT_TO_ZABBIX

Get TTN data by mqtt protocol and send the information to zabbix server.

## Information

This script shoud be installed in the zabbix server.

## Install dependences

```bash
sudo apt-get install mosquitto-clients
```

## Install script

1. Copy script 'mqtt_to_zabbix.sh' to root@zabbix-lorawan:/root/.
2. Create file 'ttn.pass' in root@zabbix-lorawan:/root/.
3. Create file 'ttn.user' in root@zabbix-lorawan:/root/.
4. Complete ttn.pass y ttn.user with the information of TTN.

## TTN Access

1. The file ttn.user has the name of the applicacion and the tenant.

Example: agustin@ttn

2. The file ttn.pass has the password generated from the TTN webpage > Application > API Keys

Example: NNSXS5JQNL.5KWNU7WF53Z5VGCT3G7CNV7IB5KND3Y7XR4P4TI.VHOUYZHT4RJPCYIEG3673J3JX2UKEISOQM4GW4IZ2I5UKCQ

## Tested

It was tested with TTN v3 and Zabbix 6.2.0