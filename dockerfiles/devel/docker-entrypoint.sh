#!/bin/bash

if [ "$1" = "/usr/sbin/sshd" ]; then
	mkdir -p /var/run/sshd
fi

env > /etc/docker-env

sudo -u sakai /home/sakai/bin/development-environment-setup

exec "$@"
