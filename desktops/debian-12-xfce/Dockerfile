ARG BASE_DESKTOP_IMAGE
FROM ${BASE_DESKTOP_IMAGE}

ARG REQUIRED_PACKAGES=" \
    firefox-esr \
    libxfce4ui-utils \
    mousepad \
    tango-icon-theme \
    thunar \
    xfce4-appfinder \
    xfce4-panel \
    xfce4-session \
    xfce4-settings \
    xfce4-taskmanager \
    xfce4-terminal \
    xfconf \
    xfdesktop4 \
    xfwm4 \
    "

RUN apt-get update -y && \
    apt-get install --no-install-recommends -y \
    $REQUIRED_PACKAGES && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f \
    /etc/xdg/autostart/xscreensaver.desktop

COPY root /

RUN chmod 777 /opt/gow/desktop.sh