#!/bin/sh
#------------------------------------------------------------------------------#
#  This script starts other scripts sequential. The script was written for     #
#  and tested on a Netgear WNDR3700 v1 with DD-WRT 36079 for distributing      #
#  settings to Access Points or Nodes.                                         #
#  Author: dev@hnjameindersma.net                                              #
#  Date: 2018-11-12                                                            #
#------------------------------------------------------------------------------#

echo -e "\e[100mStartup:\e[49m Starting startup script at $(date)"

echo -e "\e[100mStartup:\e[49m Starting script: /mnt/smbshare/sync_node.sh"
sh /mnt/smbshare/sync_node.sh
echo -e "\e[100mStartup:\e[49m Script ended: /mnt/smbshare/sync_node.sh"

echo -e "\e[100mStartup:\e[49m Starting script: /mnt/smbshare/sync_settings.sh"
sh /mnt/smbshare/sync_settings.sh
echo -e "\e[100mStartup:\e[49m Script ended: /mnt/smbshare/sync_settings.sh"

echo -e "\e[100mStartup:\e[49m Starting script: /mnt/smbshare/sync_wifi.sh"
sh /mnt/smbshare/sync_wifi.sh
echo -e "\e[100mStartup:\e[49m Script ended: /mnt/smbshare/sync_wifi.sh"

echo -e "\e[100mStartup:\e[49m Startup script ended at $(date)"
