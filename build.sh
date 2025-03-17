#!/bin/bash

set -ouex pipefail

# Install ghostty, get rid of previous terminal
dnf5 -y copr enable pgdev/ghostty
dnf5 -y install ghostty
dnf5 -y copr disable pgdev/ghostty
dnf5 -y remove ptyxis

# Install apps I want
dnf5 -y install zsh neovim python3-neovim

# VDPAU for NVIDIA
dnf5 -y install nvidia-vaapi-driver libva-utils vdpauinfo

# pyenv/Python deps
dnf5 -y group install "development-tools"
dnf5 -y install zlib-devel bzip2 bzip2-devel readline-devel sqlite \
    sqlite-devel openssl-devel xz xz-devel libffi-devel findutils tk-devel

# Certain build tools I need..
dnf5 -y install libstdc++-static

# Remove apps I don't care about
dnf5 -y remove waydroid # Maybe later?
dnf5 -y remove ghostscript # I don't print on desktop, and I hate CUPS
dnf5 -y remove kate-libs # KWrite/Kate

# Fonts! After install, get Windows 11 fonts from the Windows ISO and put them in $HOME/.local/share/fonts
dnf5 -y install --allowerasing --skip-broken google-noto-*
dnf5 -y install --allowerasing --skip-broken jetbrains-mono-*
dnf5 -y install --allowerasing --skip-broken fira-code-fonts
