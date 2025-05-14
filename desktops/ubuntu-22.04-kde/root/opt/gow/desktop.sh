#!/bin/bash

function launch_desktop() {
    # Launching X11 desktop, xorg server has already been launched.

    # for flatpaks apps to appair in menus
    export XDG_DATA_DIRS=/var/lib/flatpak/exports/share:/home/retro/.local/share/flatpak/exports/share:/usr/local/share/:/usr/share/

    # environement variables to ensure apps integrate well with our wm or de, https://wiki.archlinux.org/title/Xdg-utils#Environment_variables
    export XDG_CURRENT_DESKTOP=KDE
    export DE=kde
    export DESKTOP_SESSION=kde
    export XDG_SESSION_TYPE=x11

    # Various envs to help with apps compability
    export XDG_SESSION_CLASS="user"
    export XDG_SESSION_TYPE="x11"
    export _JAVA_AWT_WM_NONREPARENTING=1
    export GDK_BACKEND=x11
    export MOZ_ENABLE_WAYLAND=0
    export QT_QPA_PLATFORM="xcb"
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export QT_ENABLE_HIGHDPI_SCALING=1

    # set display, unset wayland display and get dbus envs
    export DISPLAY=:9
    unset WAYLAND_DISPLAY
    export $(dbus-launch)

    # Disable compositing and screen lock
    if [ ! -f $HOME/.config/kwinrc ]; then
        kwriteconfig5 --file $HOME/.config/kwinrc --group Compositing --key Enabled false
    fi
    if [ ! -f $HOME/.config/kscreenlockerrc ]; then
        kwriteconfig5 --file $HOME/.config/kscreenlockerrc --group Daemon --key Autolock false
    fi

    # launch session
    dbus-run-session -- /usr/bin/startplasma-x11
}

launch_desktop