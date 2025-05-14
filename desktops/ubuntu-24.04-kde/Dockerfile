ARG BASE_DESKTOP_IMAGE
FROM ${BASE_DESKTOP_IMAGE}

ARG REQUIRED_PACKAGES=" \
    dolphin \
    firefox \
    gwenview \
    kde-config-gtk-style \
    kdialog \
    kfind \
    khotkeys \
    kio-extras \
    knewstuff-dialog \
    konsole \
    ksystemstats \
    kubuntu-settings-desktop \
    kubuntu-wallpapers \
    kubuntu-web-shortcuts \
    kwin-addons \
    kwin-x11 \
    kwrite \
    plasma-desktop \
    plasma-workspace \
    plymouth-theme-kubuntu-logo \
    qml-module-qt-labs-platform \
    systemsettings \
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
    sed -i \
    's/applications:org.kde.discover.desktop,/applications:org.kde.konsole.desktop,/g' \
    /usr/share/plasma/plasmoids/org.kde.plasma.taskmanager/contents/config/main.xml

COPY root /

RUN chmod 777 /opt/gow/desktop.sh