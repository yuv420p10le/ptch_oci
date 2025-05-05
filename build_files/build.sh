#!/bin/bash

set -ouex pipefail

# Install apps I want
dnf5 -y install zsh neovim python3-neovim mkvtoolnix mkvtoolnix-gui \
    python3-vapoursynth vapoursynth-devel vapoursynth-libs vapoursynth-plugins \
    vapoursynth-tools tldr thunderbird usbtop v4l-utils libunity

# Vesktop rpm - Flatpak is problematic; AppImage has some weirdness with GPU acceleration
dnf5 -y install https://vencord.dev/download/vesktop/amd64/rpm

# pyenv/Python deps
dnf5 -y group install "development-tools"
dnf5 -y group install "c-development"
dnf5 -y install zlib-devel bzip2 bzip2-devel readline-devel sqlite \
    sqlite-devel openssl-devel xz xz-devel libffi-devel findutils tk-devel

# Certain build tools I need..
dnf5 -y install libstdc++-static

# Remove apps I don't care about
dnf5 -y remove waydroid # Maybe later?
dnf5 -y remove ghostscript # I don't print on desktop, and I hate CUPS
dnf5 -y remove kate-libs # KWrite/Kate
dnf5 -y remove *akonadi* # Calendar/emails/contacts etc.. I use Thunderbird
dnf5 -y remove *krfb* # VNC remove desktop - I prefer RDP
dnf5 -y remove gamescope-session-* # I don't understand why bazzite has it at all. I'm not on the -deck variant

# Fonts! After install, get Windows 11 fonts from the Windows ISO and put them in $HOME/.local/share/fonts
dnf5 -y install --allowerasing --skip-broken google-noto-*
dnf5 -y install --allowerasing --skip-broken jetbrains-mono-*
dnf5 -y install --allowerasing --skip-broken fira-code-fonts

# This was in the upstream build.sh.. whatever?
systemctl enable podman.socket
