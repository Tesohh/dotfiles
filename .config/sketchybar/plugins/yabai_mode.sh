#!/bin/bash

yabai_mode=$(yabai -m query --spaces --space | jq '.type')

if [ $yabai_mode = '"bsp"' ]; then
    sketchybar -m --set yabai_mode label=""
elif [ $yabai_mode = '"stack"' ]; then
    sketchybar -m --set yabai_mode label="󰖯"
elif [ $yabai_mode = '"float"' ]; then
    sketchybar -m --set yabai_mode label=""
fi
