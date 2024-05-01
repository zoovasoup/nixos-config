#!/usr/bin/env bash

set_wallpaper () {
	swww img "$1" -t grow --transition-pos center
}

run_hook () {
	$HOME/.hyprland_rice/autostart_$1
}

eww () {
	~/eww/target/release/eww --config ~/.config/eww/ $*lib
}

ewws () {
    ~/eww/target/release/eww
}

eww_active () {
    ~/eww/target/release/eww active-windows
}
