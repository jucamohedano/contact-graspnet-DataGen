#!/bin/bash
# systemctl restart ssh
systemctl restart ssh

trap "exit" SIGINT
trap "exit" SIGTERM

read endless
