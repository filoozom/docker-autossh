#!/bin/sh

touch /id_rsa
chmod 0400 /id_rsa

AUTOSSH_PIDFILE=/autossh.pid \
AUTOSSH_LOGFILE=/dev/stdout \
autossh \
 -M 0 \
 -N \
 -o StrictHostKeyChecking=no \
 -o ServerAliveInterval=5 \
 -o ServerAliveCountMax=1 \
 -t -t \
 -i /id_rsa \
 -R ${SSH_TUNNEL_REMOTE}:${SSH_TUNNEL_HOST}:${SSH_TUNNEL_LOCAL} \
 -p ${SSH_HOSTPORT:=22} \
 ${SSH_HOSTUSER}@${SSH_HOSTNAME}
