#!/bin/bash

# My opinionated aurora-dx image - I only need native vkcapture

set -ouex pipefail

# obs-gamecapture COPR to allow OBS to capture OpenGL games
dnf5 -y copr enable bazzite-org/obs-vkcapture
dnf5 -y install obs-vkcapture
dnf5 -y copr disable bazzite-org/obs-vkcapture
