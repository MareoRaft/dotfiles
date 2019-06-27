#!/bin/sh

# ip address of hosts entry, e.g. "192.168.x.x"
ip_address=$1
if [ -e $ip_address ]; then
	echo "no ip address given.  aborting."
	exit 1
fi

# host name of hosts entry, e.g. "my.hostname.example.com"
host_name=$2
if [ -e $host_name ]; then
	echo "no host name given.  aborting."
	exit 1
fi

# find existing instances in the host file and save the line numbers
matches_in_hosts="$(grep -n $host_name /etc/hosts | cut -f1 -d:)"
host_entry="${ip_address}\t\t${host_name}"

if [ ! -z "$matches_in_hosts" ]
then
  echo "Found existing entry for host name '$host_name'.  Not making change for that host."
else
  echo "Adding new hosts entry."
  echo "$host_entry" | sudo tee -a /etc/hosts > /dev/null
fi
