#!/usr/bin/env bash

ip4addr=`ip -4 a | grep eth0 | awk '/inet .* scope global/ {split($2,out,"/");print out[1]}'`
	
awk "/^127\.0\.0\.1.*`hostname`/ {next} /`hostname`/ {\$1 = \"$ip4addr\"} // {print}" /etc/hosts > /etc/hosts.new && mv /etc/hosts.new /etc/hosts
