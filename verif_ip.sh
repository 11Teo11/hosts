#!/bin/bash

cat /etc/hosts | while read linie
do
	if [[ "$linie" =~ ^# ]]; then
		exit 0
	fi

	IP=`echo "$linie" | awk '{print $1}'`
	nume=`echo "$linie" | awk '{print $2}'`

	IP_nslookup=`nslookup $nume 8.8.8.8 | grep 'Address' | tail -n 1 | awk '{print $2}'`

	if [[ "$IP" != "$IP_nslookup" ]]; then
		echo "Bogus IP for $nume in /etc/hosts! Wrong ip:$IP Right ip:$IP_nslookup "
	fi
done
