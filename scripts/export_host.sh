#!/bin/bash
HOST_FILE=/etc/hosts
if [[ -z $(cat $HOST_FILE|grep "$1"|grep -v "#") ]]; then
    echo "$2	$1" >> $HOST_FILE
fi
