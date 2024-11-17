#!/bin/bash
host=$1
IP=$2
DNS=$3
IP_nslookup=`nslookup "$host" "$DNS" | grep 'Address' | tail -n 1 | awk '{print $2}'`

	if [[ "$IP" != "$IP_nslookup" ]]; then
		echo "Bogus IP for $nume in /etc/hosts! Wrong ip:$IP Right ip:$IP_nslookup "
	fi
done
