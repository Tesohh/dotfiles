# External monitor (e.g., display ID 2)
for space_id in $(yabai -m query --spaces --display 2 | jq -r '.[].id'); do
    yabai -m config --space $space_id top_padding 32
done

# Built-in monitor (e.g., display ID 1)
for space_id in $(yabai -m query --spaces --display 1 | jq -r '.[].id'); do
    yabai -m config --space $space_id top_padding 0
done
