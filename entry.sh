#!/bin/sh

#export =${ORACLE_HOME12}

#echo "Executing: $@ ..."
#exec "$@"

/usr/sbin/sshd -D
while true; do sleep 1; done
;;


