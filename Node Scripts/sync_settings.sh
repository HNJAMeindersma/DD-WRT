#!/bin/sh
#------------------------------------------------------------------------------#
#  This script synchronizes nvram settings on a DD-WRT router with the         #
#  preset settings below. The script was written for and tested on a Netgear   #
#  WNDR3700 v1 with DD-WRT 36079. This script can be used to distribute        #
#  settings to Access Points or Nodes.                                         #
#  Author: dev@hnjameindersma.net                                              #
#  Date: 2018-11-12                                                            #
#------------------------------------------------------------------------------#

# Settings
SETTINGS="
  ntp_enable=1
  ntp_mode=auto
  ntp_timer=3600
  ntp_server=europe.pool.ntp.org
  time_zone=Europe/Amsterdam
" # Split key from value with '=', one setting per line.

#------------------------------------------------------------------------------#
#  Do NOT modify anything below this line!                                     #
#------------------------------------------------------------------------------#

# Initiate script
STARTED="$(date)"
CHANGED=false
IFS='
'
echo -e "\e[42mSync Settings:\e[49m Starting settings update script at $STARTED"

# Loop over settings
for SETTING in $SETTINGS ; do

  # Split setting in key and value
  a=$SETTING; div='='; set --
  while
    b=${a#*"$div"}
    set -- "$@" "${a%%"$div"*}"
    [ "$a" != "$b" ]
  do
    a=$b
  done
  SETTING_KEY="$1"
  SETTING_KEY="$(echo -e "${1}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  SETTING_VALUE="$2"
  SETTING_VALUE="$(echo -e "${2}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

  # Check if setting value is different and should be updated
  if [ "$(nvram get $SETTING_KEY)" == "$SETTING_VALUE" ]; then
    echo -e "\e[42mSync Settings:\e[49m $SETTING_KEY is up-to-date ($SETTING_VALUE)"
  else
    echo -e "\e[42mSync Settings:\e[49m $SETTING_KEY will be updated to $SETTING_VALUE"
    nvram set $SETTING_KEY=$SETTING_VALUE
    CHANGED=true
  fi

done

# Reboot if changes are made
if [ $CHANGED = true ]; then
  echo -e "\e[42mSync Settings:\e[49m Changes are made and will be safed"
  nvram commit
  echo -e "\e[42mSync Settings:\e[49m Must reboot to take changes into effect"
  ENDED="$(date)"
  echo -e "\e[42mSync Settings:\e[49m Script ended at $ENDED"
  reboot
  exit 1
else
  echo -e "\e[42mSync Settings:\e[49m No changes were made"
  ENDED="$(date)"
  echo -e "\e[42mSync Settings:\e[49m Script ended at $ENDED"
fi
