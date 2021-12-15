#!/bin/sh

#export =${ORACLE_HOME12}

#echo "Executing: $@ ..."
#exec "$@"

nvim +PlugInstall +qa

/usr/sbin/sshd -D
while true; do sleep 1; done
;;


