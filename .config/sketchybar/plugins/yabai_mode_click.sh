yabai_mode=$(yabai -m query --spaces --space | jq '.type')

if [ $yabai_mode = '"bsp"' ]; then
    yabai -m space --layout stack
    sketchybar -m --set yabai_mode label="󰖯"
elif [ $yabai_mode = '"stack"' ]; then
    yabai -m space --layout float
    sketchybar -m --set yabai_mode label=""
elif [ $yabai_mode = '"float"' ]; then
    yabai -m space --layout bsp
    sketchybar -m --set yabai_mode label=""
fi

# yabai_mode=$(yabai -m query --spaces --display | jq -r 'map(select(."focused" == 1))[-1].type')
#
# case "$yabai_mode" in
#     bsp)
#     yabai -m config layout stack && sketchybar -m --set yabai_mode label="?"
#     ;;
#     stack)
#     yabai -m config layout float && sketchybar -m --set yabai_mode label="?"
#     ;;
#     float)
#     yabai -m config layout bsp && sketchybar -m --set yabai_mode label="?"
#     ;;
# esac
