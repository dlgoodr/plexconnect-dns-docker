#!/usr/bin/env bash

IFS=" "

read -a ip_dnsmaster_array <<< "$ip_dnsmaster"
for dnsmaster in "${ip_dnsmaster_array[@]}"; do
    echo "server=$dnsmaster" >> /etc/dnsmasq/00-defaults.conf
done

read -a hosttointercept_array <<< "$hosttointercept"
for host in "${hosttointercept_array[@]}"; do
    echo "address=/${host}/${ip_pms}" >> /etc/dnsmasq/01-plexconnect.conf
done

dnsmasq
