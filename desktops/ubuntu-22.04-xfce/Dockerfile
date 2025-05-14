ARG BASE_DESKTOP_IMAGE
FROM ${BASE_DESKTOP_IMAGE}

ARG REQUIRED_PACKAGES=" \
    firefox \
    mousepad \
    xfce4-terminal \
    xfce4 \
    xubuntu-default-settings \
    xubuntu-icon-theme \
    "

RUN apt-get update -y && \
    mkdir -p /etc/apt/preferences.d/ && \
    echo "Package: firefox*\nPin: release o=Ubuntu*\nPin-Priority: -1" > /etc/apt/preferences.d/firefox-no-snap && \
    apt-get install -y \
    software-properties-common && \
    add-apt-repository -y ppa:mozillateam/ppa && \
    apt-get update -y && \
    apt-get install --no-install-recommends -y \
    $REQUIRED_PACKAGES && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f \
    /etc/xdg/autostart/xscreensaver.desktop

COPY root /

RUN chmod 777 /opt/gow/desktop.sh