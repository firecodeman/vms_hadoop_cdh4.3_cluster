#!/bin/bash
ENV_FILE=/etc/profile.d/hadoop_ecosystem.sh
if [[ -d "$2" ]]; then
  if [[ -z $(cat $ENV_FILE|grep "$1="|grep -v "#") ]]; then
    echo "$1=$2" >> $ENV_FILE
  fi
fi
