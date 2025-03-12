#!/bin/bash

set -ouex pipefail

# Install ghostty, get rid of previous terminal
dnf5 -y copr enable pgdev/ghostty
dnf5 -y install ghostty
dnf5 -y copr disable pgdev/ghostty
dnf5 -y remove ptyxis

# Install apps I want
dnf5 -y install zsh neovim python3-neovim

# Remove apps I don't care about
dnf5 -y remove waydroid # Maybe later?
dnf5 -y remove ghostscript # I don't print on desktop, and I hate CUPS
dnf5 -y remove kate-libs # KWrite/Kate

# Fonts! After install, get Windows 11 fonts from the Windows ISO and put them in $HOME/.local/share/fonts
dnf5 install -y --allowerasing --skip-broken google-noto-*
