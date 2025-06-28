#!/bin/bash

# My opinionated aurora-dx image

set -ouex pipefail

# Fonts I like; get Windows 11 fonts from the Windows ISO and put them in $HOME/.local/share/fonts
dnf5 -y install --allowerasing --skip-broken google-noto-*
dnf5 -y install --allowerasing --skip-broken jetbrains-mono-*
dnf5 -y install --allowerasing --skip-broken fira-code-fonts

# obs-gamecapture COPR to allow OBS to capture OpenGL games
dnf5 -y copr enable bazzite-org/obs-vkcapture
dnf5 -y install obs-vkcapture
dnf5 -y copr disable bazzite-org/obs-vkcapture

# This was in the upstream build.sh.. whatever?
systemctl enable podman.socket
