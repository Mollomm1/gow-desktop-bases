#!/bin/bash

function launch_xorg() {
    # start xwayland at :9
    Xwayland :9 &
    sleep 2
    xrandr --output XWAYLAND0 --mode ${GAMESCOPE_WIDTH}x${GAMESCOPE_HEIGHT}
}

launch_xorg
sleep 1
sudo /opt/gow/dbus.sh # start dbus as root
/opt/gow/desktop.sh # start desktop