# gow-desktop-bases

Base images for creating desktop containers for Wolf.

Most of the Dockerfiles for desktop images are heavily based on [webtop](https://github.com/linuxserver/docker-webtop).

## Base Desktop Image Types
| Distro        | Type | Image |
| ------------- | ---- | ----- |
| Ubuntu 22.04  | deb  | ghcr.io/mollomm1/ubuntu-22.04-base-desktop:latest |
| Ubuntu 24.04  | deb  | ghcr.io/mollomm1/ubuntu-24.04-base-desktop:latest |
| Debian 12     | deb  | ghcr.io/mollomm1/debian-12-base-desktop:latest |

> The default base desktop utilizes X11 with Openbox.

## Desktop Images

| Type          | Image |
| ------------- | ---- |
| ubuntu-22.04-xfce | ghcr.io/mollomm1/ubuntu-22.04-xfce:latest |
| ubuntu-24.04-xfce | ghcr.io/mollomm1/ubuntu-24.04-xfce:latest |
| debian-12-xfce | ghcr.io/mollomm1/debian-12-xfce:latest |
| ubuntu-22.04-kde | ghcr.io/mollomm1/ubuntu-22.04-kde:latest |
| ubuntu-24.04-kde | ghcr.io/mollomm1/ubuntu-24.04-kde:latest |
| debian-12-kde | ghcr.io/mollomm1/debian-12-kde:latest |

> All images contain only the desktop environment and Firefox or Chromium.

## Adding to Wolf

To add one of the following configurations to your `config.toml` (by default located at `/etc/wolf/cfg/config.toml`), use the details below:

<summary>Debian 12 XFCE (Without Flatpak)</summary>

```toml
[[apps]]
start_virtual_compositor = true
title = 'Debian 12 XFCE'

    [apps.runner]
    base_create_json = '''{
  "HostConfig": {
    "IpcMode": "host",
    "CapAdd": [],
    "SecurityOpt": ["seccomp=unconfined"],
    "Ulimits": [{"Name":"nofile", "Hard":10240, "Soft":10240}],
    "Privileged": false,
    "DeviceCgroupRules": ["c 13:* rmw", "c 244:* rmw"]
  }
}
'''
    devices = []
    env = [
        'GOW_REQUIRED_DEVICES=/dev/input/* /dev/dri/* /dev/nvidia*'
    ]
    image = 'ghcr.io/mollomm1/debian-12-xfce:latest'
    mounts = []
    name = 'debian12'
    ports = []
    type = 'docker'
```
</details>


> Flatpak requires certain capabilities (CapAdd) to function properly: ["SYS_ADMIN", "SYS_NICE", "SYS_PTRACE", "NET_RAW", "MKNOD", "NET_ADMIN"], along with AppArmor and seccomp set to unconfined.