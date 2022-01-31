#!/bin/bash
# systemctl restart ssh
sudo systemctl restart ssh

trap "exit" SIGINT
trap "exit" SIGTERM

read endless