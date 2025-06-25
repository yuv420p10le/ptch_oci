#!/bin/bash

# My opinionated aurora-dx image

set -ouex pipefail

# Some apps such as Thunderbird and Vesktop will trigger notifications
# The notifications cannot be clicked on the Flatpak version of the apps
# Workarounds include using the native RPM version of the apps, or the AppImage (if exists)
# For Thunderbird, I just use upstream so I can click the notifications
# For Vesktop, the AppImage version would normally be fine, but if I use the AppImage
# in conjution with libunity, then it'll actually display the notification count in the app icon
# v4l-utils is needed for OBS Virtual Camera
dnf5 -y install thunderbird v4l-utils libunity

# Fonts I like; get Windows 11 fonts from the Windows ISO and put them in $HOME/.local/share/fonts
dnf5 -y install --allowerasing --skip-broken google-noto-*
dnf5 -y install --allowerasing --skip-broken jetbrains-mono-*
dnf5 -y install --allowerasing --skip-broken fira-code-fonts

# Vesktop
# Installs to /opt/Vesktop by default, we'll move it to /usr/share/vesktop
dnf5 -y install --allowerasing --skip-broken "https://vencord.dev/download/vesktop/amd64/rpm"
mkdir -p /usr/share/Vesktop
cp -r /opt/Vesktop /usr/share/
sed -i 's#/opt/Vesktop#/usr/share/Vesktop#g' /usr/share/applications/vesktop.desktop

# This was in the upstream build.sh.. whatever?
systemctl enable podman.socket
