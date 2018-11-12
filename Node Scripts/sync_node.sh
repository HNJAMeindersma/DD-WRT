#!/bin/sh
#------------------------------------------------------------------------------#
#  This script synchronizes nvram settings on a DD-WRT router with the         #
#  preset settings below. The script was written for and tested on a Netgear   #
#  WNDR3700 v1 with DD-WRT 36079. This script can be used to distribute        #
#  settings to Access Points or Nodes.                                         #
#  Author: dev@hnjameindersma.net                                              #
#  Date: 2018-11-12                                                            #
#------------------------------------------------------------------------------#

# Nodes
NODES="
  samba_node1=node1=192.168.1.10
  samba_node2=node2=192.168.1.20
  samba_node3=node3=192.168.1.30
" # Split key from value with '=', one setting per line.

#------------------------------------------------------------------------------#
#  Do NOT modify anything below this line!                                     #
#------------------------------------------------------------------------------#

# Initiate script
STARTED="$(date)"
CHANGED=false
FOUND=false
IFS='
'
echo -e "\e[43mSync Node:\e[49m Starting node update script at $STARTED"

# Loop over nodes
for NODE in $NODES ; do

  # Split node in key and values
  a=$NODE; div='='; set --
  while
    b=${a#*"$div"}
    set -- "$@" "${a%%"$div"*}"
    [ "$a" != "$b" ]
  do
    a=$b
  done
  SETTING_KEY="$1"
  SETTING_KEY="$(echo -e "${1}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  SETTING_VALUE1="$2"
  SETTING_VALUE1="$(echo -e "${2}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  SETTING_VALUE2="$3"
  SETTING_VALUE3="$(echo -e "${3}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

  # Check if node is found and change settings
  if [ "$(nvram get samba_user)" == "$SETTING_KEY" ]; then

    # Node is found
    echo -e "\e[43mSync Node:\e[49m Client username $SETTING_KEY found!"
    FOUND=true

    # Check wan_hostname
    if [ "$(nvram get wan_hostname)" != "$SETTING_VALUE1" ]; then
      echo -e "\e[43mSync Node:\e[49m Changing wan_hostname to $SETTING_VALUE1"
      nvram set wan_hostname=$SETTING_VALUE1
      CHANGED=true
    else
      echo -e "\e[43mSync Node:\e[49m wan_hostname is up-to-date ($SETTING_VALUE1)"
    fi

    # Check lan_ipaddr
    if [ "$(nvram get lan_ipaddr)" != "$SETTING_VALUE2" ]; then
      echo -e "\e[43mSync Node:\e[49m Changing lan_ipaddr to $SETTING_VALUE2"
      nvram set lan_ipaddr=$SETTING_VALUE2
      CHANGED=true
    else
      echo -e "\e[43mSync Node:\e[49m lan_ipaddr is up-to-date ($SETTING_VALUE2)"
    fi

  fi

  # Node is not found
  if [ $FOUND = false ]; then
    echo -e "\e[43mSync Node:\e[49m Client username not found ($(nvram get samba_user))"
  fi

done

# Reboot if changes are made
if [ $CHANGED = true ]; then
  echo -e "\e[43mSync Node:\e[49m Changes are made and will be safed"
  nvram commit
  echo -e "\e[43mSync Node:\e[49m Must reboot to take changes into effect"
  ENDED="$(date)"
  echo -e "\e[43mSync Node:\e[49m Script ended at $ENDED"
  reboot
  exit 1
else
  echo -e "\e[43mSync Node:\e[49m No changes were made"
  ENDED="$(date)"
  echo -e "\e[43mSync Node:\e[49m Script ended at $ENDED"
fi
