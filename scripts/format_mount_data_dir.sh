#!/bin/bash
if [ -e /dev/sdb ];then
  yes|mkfs -t ext4 -m 1 -O dir_index,extent,sparse_super /dev/sdb
  disk_uid="$(ls -l /dev/disk/by-uuid/|grep sdb|awk '{print $9}')"
  cond_uid_exists="$(cat /etc/fstab|grep ${disk_uid} | grep -v '#')"
  cond_dir_exists="$(cat /etc/fstab|grep '/data/1' | grep -v '#')"
  cond_has_mount="$(df -h|grep '/data/1')"
  if [ -n "${disk_uid}" ] && [  -z "${cond_uid_exists}"] && [ -z "${cond_dir_exists}" ] && [ -z "${cond_has_mount}" ];then
    #echo "/dev/sdb          /data/1          ext4    noatime,nodiratime        1       2" >> /etc/fstab
    mkdir -p /data/1 && mount -v /dev/sdb /data/1
  fi
fi

