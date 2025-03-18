# FROM ghcr.io/ublue-os/bazzite-nvidia-open:stable

# Go back to proprietary driver until GSP issues are fixed for KDE
FROM ghcr.io/ublue-os/bazzite-nvidia:stable

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
    
