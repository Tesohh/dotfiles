options="shutdown
reboot
logout
lock
"

res=$(echo "$options" | fuzzel --dmenu)
case $res in
    "shutdown") hyprshutdown -t "shutting down..." --post-cmd  'shutdown -P 0' ;;
    "reboot") hyprshutdown -t "shutting down..." --post-cmd  'reboot' ;;
    "logout") hyprshutdown -t "exiting hyprland..." ;;
    "lock") hyprlock ;;
    *) default ;;
esac

