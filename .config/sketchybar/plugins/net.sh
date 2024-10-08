#!/usr/bin/env sh

source "$CONFIG_DIR/colors.sh"

# When switching between devices, it's possible to get hit with multiple
# concurrent events, some of which may occur before `scutil` picks up the
# changes, resulting in race conditions.
#

NET_USB="􀺦"
NET_THUNDERBOLT="􀋦"
NET_HOTSPOT="􀉣"
NET_DISCONNECTED="􁣡"
NET_WIFI="􀙇"
NET_OFF=􀙈

sleep 1

services=$(networksetup -listnetworkserviceorder)
device=$(scutil --nwi | sed -n "s/.*Network interfaces: \([^,]*\).*/\1/p")

test -n "$device" && service=$(echo "$services" \
  | sed -n "s/.*Hardware Port: \([^,]*\), Device: $device.*/\1/p")

color=$MUTED
case $service in
  "iPhone USB")         icon=$NET_USB;;
  "Thunderbolt Bridge") icon=$NET_THUNDERBOLT;;

  #ssid =  networksetup -getairportnetwork "$device" \
    #| sed -n "s/Current Wi-Fi Network: \(.*\)/\1/p"
  Wi-Fi)
    ssid=$(system_profiler SPAirPortDataType | awk '/Current Network/ {getline;$1=$1;print $0 | "tr -d ':'";exit}')
    case $ssid in
      *iPhone*) icon=$NET_HOTSPOT;;
      "")       icon=$NET_DISCONNECTED; color=$RED;;
      *)        icon=$NET_WIFI;;
    esac;;

  *)
    wifi_device=$(echo "$services" \
      | sed -n "s/.*Hardware Port: Wi-Fi, Device: \([^\)]*\).*/\1/p")
    test -n "$wifi_device" && status=$( \
      networksetup -getairportpower "$wifi_device" | awk '{print $NF}')
    icon=$(test "$status" = On && echo "$NET_DISCONNECTED" || echo "$NET_OFF")
    color=$RED;;
esac

touch ~/dotfiles/logs/device.txt
touch ~/dotfiles/logs/service.txt
touch ~/dotfiles/logs/ssid.txt

echo "Device: $device" >> ~/dotfiles/logs/device.txt
echo "Service: $service" >> ~/dotfiles/logs/service.txt
echo "SSID: $ssid" >> ~/dotfiles/logs/ssid.txt

sketchybar --animate sin 5 --set "$NAME" icon="$icon" icon.color="$color"
