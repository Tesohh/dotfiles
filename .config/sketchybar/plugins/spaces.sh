#!/bin/bash

source "$CONFIG_DIR/colors.sh"

SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10)

for sid in "${SPACE_SIDS[@]}"
do
  sketchybar --add space space.$sid left                                 \
             --set space.$sid space=$sid                                 \
                              icon=$sid                                  \
                              background.corner_radius=5            \
                             background.height=24\
                              label.font="sketchybar-app-font:Regular:14.0" \
                              label.padding_right=15                     \
                              label.y_offset=-1                          \
                              script="$PLUGIN_DIR/space.sh"
done

sketchybar --add item space_separator left                             \
           --set space_separator icon="􀆊"                                \
                                 icon.color=$ACCENT_COLOR \
                                 label.drawing=off                     \
                                 background.drawing=off                \
                                 script="$PLUGIN_DIR/space_windows.sh" \
           --subscribe space_separator space_windows_change
                                 # icon.padding_left=4                   \
