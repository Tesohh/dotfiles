#!/bin/sh

sketchybar -m --set focus icon.color=0xFFFFFFFF
sketchybar -m --set focus icon.padding_right=-6
sketchybar -m --set focus background.corner_radius=5
sketchybar -m --set focus background.height=24

source "$CONFIG_DIR/colors.sh"


if [ $SENDER = "focus_off" ]; then
    # sketchybar -m --set focus icon.color=0xFF999999
  sketchybar --set $NAME icon.drawing=off \
      background.drawing=off

elif [ $SENDER = "focus_on" ]; then
    # sketchybar -m --set focus icon.color=0xFFFFFFFF
    sketchybar --set $NAME background.drawing=on \
                         icon.drawing=on \
                         background.color=$PURPLE \
                         label.color=$BAR \
                         icon.color=$BAR

elif [ $SENDER = "forced" ]; then
  sketchybar --set $NAME icon.drawing=off \
      background.drawing=off
fi
