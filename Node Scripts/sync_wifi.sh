#!/bin/sh
#------------------------------------------------------------------------------#
#  This script synchronizes nvram settings on a DD-WRT router with the         #
#  preset settings below. The script was written for and tested on a Netgear   #
#  WNDR3700 v1 with DD-WRT 36079. This script can be used to distribute        #
#  settings to Access Points or Nodes.                                         #
#  Author: dev@hnjameindersma.net                                              #
#  Date: 2018-11-12                                                            #
#------------------------------------------------------------------------------#

# Wireless settings
RADIO_CONTROL=false                 # Control over NET_MODE, CHANNEL, CHANNELBW

ath0_MODE="ap"                      # Access Point mode
ath0_NET_MODE="mixed"               # Wireless mode type
ath0_CHANNEL="auto"                 # Wireless channel
ath0_CHANNELBW="20"                 # Wireless bandwidth
ath0_SSID="MyWiFi"                  # SSID network name
ath0_REGDOMAIN="NETHERLANDS"        # Regional code
ath0_MAXASSOC="32"                  # Maximum wireless clients
ath0_SECURITY_MODE="psk2"           # Security mode
ath0_CRYPTO="aes"                   # Password type
ath0_WPA_PSK="MyWiFiPassword"       # Pre-shared password

ath1_MODE="ap"                      # Access Point mode
ath1_NET_MODE="mixed"               # Wireless mode type
ath1_CHANNEL="auto"                 # Wireless channel
ath1_CHANNELBW="20"                 # Wireless bandwidth
ath1_SSID="MyWiFi"                  # SSID network name
ath1_REGDOMAIN="NETHERLANDS"        # Regional code
ath1_MAXASSOC="32"                  # Maximum wireless clients
ath1_SECURITY_MODE="psk2"           # Security mode
ath1_CRYPTO="aes"                   # Password type
ath1_WPA_PSK="MyWiFiPassword"       # Pre-shared password

#------------------------------------------------------------------------------#
#  Do NOT modify anything below this line!                                     #
#------------------------------------------------------------------------------#

STARTED="$(date)"
CHANGED=false
echo -e "\e[44mSync WiFi:\e[49m Starting WiFi settings update script at $STARTED"

if [ "$(nvram get ath0_mode)" = "$ath0_MODE" ]; then
  echo -e "\e[44mSync WiFi:\e[49m ath0 - MODE is up-to-date ($ath0_MODE)"
else
  echo -e "\e[44mSync WiFi:\e[49m ath0 - MODE will be updated to $ath0_MODE"
  nvram set ath0_mode=$ath0_MODE
  CHANGED=true
fi

if [ $RADIO_CONTROL = true ]; then
  if [ "$(nvram get ath0_net_mode)" = "$ath0_NET_MODE" ]; then
    echo -e "\e[44mSync WiFi:\e[49m ath0 - NET MODE is up-to-date ($ath0_NET_MODE)"
  else
    echo -e "\e[44mSync WiFi:\e[49m ath0 - NET MODE will be updated to $ath0_NET_MODE"
    nvram set ath0_net_mode=$ath0_NET_MODE
    CHANGED=true
  fi
fi

if [ $RADIO_CONTROL = true ]; then
  if [ "$(nvram get ath0_channel)" = "$ath0_CHANNEL" ]; then
    echo -e "\e[44mSync WiFi:\e[49m ath0 - CHANNEL is up-to-date ($ath0_CHANNEL)"
  else
    echo -e "\e[44mSync WiFi:\e[49m ath0 - CHANNEL will be updated to $ath0_CHANNEL"
    nvram set ath0_channel=$ath0_CHANNEL
    CHANGED=true
  fi
fi

if [ $RADIO_CONTROL = true ]; then
  if [ "$(nvram get ath0_channelbw)" = "$ath0_CHANNELBW" ]; then
    echo -e "\e[44mSync WiFi:\e[49m ath0 - CHANNELBW is up-to-date ($ath0_CHANNELBW)"
  else
    echo -e "\e[44mSync WiFi:\e[49m ath0 - CHANNELBW will be updated to $ath0_CHANNELBW"
    nvram set ath0_channelbw=$ath0_CHANNELBW
    CHANGED=true
  fi
fi

if [ "$(nvram get ath0_ssid)" = "$ath0_SSID" ]; then
  echo -e "\e[44mSync WiFi:\e[49m ath0 - SSID is up-to-date ($ath0_SSID)"
else
  echo -e "\e[44mSync WiFi:\e[49m ath0 - SSID will be updated to $ath0_SSID"
  nvram set ath0_ssid=$ath0_SSID
  CHANGED=true
fi

if [ "$(nvram get ath0_regdomain)" = "$ath0_REGDOMAIN" ]; then
  echo -e "\e[44mSync WiFi:\e[49m ath0 - REGDOMAIN is up-to-date ($ath0_REGDOMAIN)"
else
  echo -e "\e[44mSync WiFi:\e[49m ath0 - REGDOMAIN will be updated to $ath0_REGDOMAIN"
  nvram set ath0_regdomain=$ath0_REGDOMAIN
  CHANGED=true
fi

if [ "$(nvram get ath0_maxassoc)" = "$ath0_MAXASSOC" ]; then
  echo -e "\e[44mSync WiFi:\e[49m ath0 - MAXASSOC is up-to-date ($ath0_MAXASSOC)"
else
  echo -e "\e[44mSync WiFi:\e[49m ath0 - MAXASSOC will be updated to $ath0_MAXASSOC"
  nvram set ath0_maxassoc=$ath0_MAXASSOC
  CHANGED=true
fi

if [ "$(nvram get ath0_security_mode)" = "$ath0_SECURITY_MODE" ]; then
  echo -e "\e[44mSync WiFi:\e[49m ath0 - SECURITY MODE is up-to-date ($ath0_SECURITY_MODE)"
else
  echo -e "\e[44mSync WiFi:\e[49m ath0 - SECURITY MODE will be updated to $ath0_SECURITY_MODE"
  nvram set ath0_security_mode=$ath0_SECURITY_MODE
  CHANGED=true
fi

if [ "$(nvram get ath0_crypto)" = "$ath0_CRYPTO" ]; then
  echo -e "\e[44mSync WiFi:\e[49m ath0 - CRYPTO is up-to-date ($ath0_CRYPTO)"
else
  echo -e "\e[44mSync WiFi:\e[49m ath0 - CRYPTO will be updated to $ath0_CRYPTO"
  nvram set ath0_crypto=$ath0_CRYPTO
  CHANGED=true
fi

if [ "$(nvram get ath0_wpa_psk)" = "$ath0_WPA_PSK" ]; then
  echo -e "\e[44mSync WiFi:\e[49m ath0 - WPA PSK is up-to-date ($ath0_WPA_PSK)"
else
  echo -e "\e[44mSync WiFi:\e[49m ath0 - WPA PSK will be updated to $ath0_WPA_PSK"
  nvram set ath0_wpa_psk=$ath0_WPA_PSK
  CHANGED=true
fi

if [ "$(nvram get ath1_mode)" = "$ath1_MODE" ]; then
  echo -e "\e[44mSync WiFi:\e[49m ath1 - MODE is up-to-date ($ath1_MODE)"
else
  echo -e "\e[44mSync WiFi:\e[49m ath1 - MODE will be updated to $ath1_MODE"
  nvram set ath1_mode=$ath1_MODE
  CHANGED=true
fi

if [ $RADIO_CONTROL = true ]; then
  if [ "$(nvram get ath1_net_mode)" = "$ath1_NET_MODE" ]; then
    echo -e "\e[44mSync WiFi:\e[49m ath1 - NET MODE is up-to-date ($ath1_NET_MODE)"
  else
    echo -e "\e[44mSync WiFi:\e[49m ath1 - NET MODE will be updated to $ath1_NET_MODE"
    nvram set ath1_net_mode=$ath1_NET_MODE
    CHANGED=true
  fi
fi

if [ $RADIO_CONTROL = true ]; then
  if [ "$(nvram get ath1_channel)" = "$ath1_CHANNEL" ]; then
    echo -e "\e[44mSync WiFi:\e[49m ath1 - CHANNEL is up-to-date ($ath1_CHANNEL)"
  else
    echo -e "\e[44mSync WiFi:\e[49m ath1 - CHANNEL will be updated to $ath1_CHANNEL"
    nvram set ath1_channel=$ath1_CHANNEL
    CHANGED=true
  fi
fi

if [ $RADIO_CONTROL = true ]; then
  if [ "$(nvram get ath1_channelbw)" = "$ath1_CHANNELBW" ]; then
    echo -e "\e[44mSync WiFi:\e[49m ath1 - CHANNELBW is up-to-date ($ath1_CHANNELBW)"
  else
    echo -e "\e[44mSync WiFi:\e[49m ath1 - CHANNELBW will be updated to $ath1_CHANNELBW"
    nvram set ath1_channelbw=$ath1_CHANNELBW
    CHANGED=true
  fi
fi

if [ "$(nvram get ath1_ssid)" = "$ath1_SSID" ]; then
  echo -e "\e[44mSync WiFi:\e[49m ath1 - SSID is up-to-date ($ath1_SSID)"
else
  echo -e "\e[44mSync WiFi:\e[49m ath1 - SSID will be updated to $ath1_SSID"
  nvram set ath1_ssid=$ath1_SSID
  CHANGED=true
fi

if [ "$(nvram get ath1_regdomain)" = "$ath1_REGDOMAIN" ]; then
  echo -e "\e[44mSync WiFi:\e[49m ath1 - REGDOMAIN is up-to-date ($ath1_REGDOMAIN)"
else
  echo -e "\e[44mSync WiFi:\e[49m ath1 - REGDOMAIN will be updated to $ath1_REGDOMAIN"
  nvram set ath1_regdomain=$ath1_REGDOMAIN
  CHANGED=true
fi

if [ "$(nvram get ath1_maxassoc)" = "$ath1_MAXASSOC" ]; then
  echo -e "\e[44mSync WiFi:\e[49m ath1 - MAXASSOC is up-to-date ($ath1_MAXASSOC)"
else
  echo -e "\e[44mSync WiFi:\e[49m ath1 - MAXASSOC will be updated to $ath1_MAXASSOC"
  nvram set ath1_maxassoc=$ath1_MAXASSOC
  CHANGED=true
fi

if [ "$(nvram get ath1_security_mode)" = "$ath1_SECURITY_MODE" ]; then
  echo -e "\e[44mSync WiFi:\e[49m ath1 - SECURITY MODE is up-to-date ($ath1_SECURITY_MODE)"
else
  echo -e "\e[44mSync WiFi:\e[49m ath1 - SECURITY MODE will be updated to $ath1_SECURITY_MODE"
  nvram set ath1_security_mode=$ath1_SECURITY_MODE
  CHANGED=true
fi

if [ "$(nvram get ath1_crypto)" = "$ath1_CRYPTO" ]; then
  echo -e "\e[44mSync WiFi:\e[49m ath1 - CRYPTO is up-to-date ($ath1_CRYPTO)"
else
  echo -e "\e[44mSync WiFi:\e[49m ath1 - CRYPTO will be updated to $ath1_CRYPTO"
  nvram set ath1_crypto=$ath1_CRYPTO
  CHANGED=true
fi

if [ "$(nvram get ath1_wpa_psk)" = "$ath1_WPA_PSK" ]; then
  echo -e "\e[44mSync WiFi:\e[49m ath1 - WPA PSK is up-to-date ($ath1_WPA_PSK)"
else
  echo -e "\e[44mSync WiFi:\e[49m ath1 - WPA PSK will be updated to $ath1_WPA_PSK"
  nvram set ath1_wpa_psk=$ath1_WPA_PSK
  CHANGED=true
fi

if [ $CHANGED = true ]; then
  echo -e "\e[44mSync WiFi:\e[49m Changes are made and will be safed"
  nvram commit
  ENDED="$(date)"
  echo -e "\e[44mSync WiFi:\e[49m Script ended at $ENDED"
  echo -e "\e[44mSync WiFi:\e[49m Must reboot to take changes into effect"
  reboot
  exit 1
else
  echo -e "\e[44mSync WiFi:\e[49m No changes were made"
  ENDED="$(date)"
  echo -e "\e[44mSync WiFi:\e[49m Script ended at $ENDED"
fi
