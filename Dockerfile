FROM uwebarthel/hypriot-image-builder:latest

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    binfmt-support \
    qemu \
    qemu-user-static \
    xxd \
    # install kernel required by guestfish/supermin
    "linux-image-$(dpkg --print-architecture)" \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY builder/ /builder/

# build sd card image
CMD /builder/build.sh
