ARG BASE_APP_IMAGE
FROM ${BASE_APP_IMAGE}

ARG REQUIRED_PACKAGES="\
    xwayland x11-xserver-utils \
    xterm \
    openbox menu python3-xdg \
    dbus-x11 \
    sudo \
    "

RUN apt-get update -y && \
    apt-get install -y \
    $REQUIRED_PACKAGES && \
    update-menus && \
    rm -rf /var/lib/apt/lists/*

COPY root /

RUN chmod 777 /opt/gow/desktop.sh /opt/gow/dbus.sh /opt/gow/xorg.sh /opt/gow/startup.sh && \
    echo "ALL ALL=NOPASSWD: /opt/gow/dbus.sh" > /etc/sudoers.d/dbus

# force running sway by default
ENV RUN_SWAY=1 
