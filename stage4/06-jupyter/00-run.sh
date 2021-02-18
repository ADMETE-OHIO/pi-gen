#!/bin/bash

# install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/"
# install -m 644 one-time-pad.ipynb "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/one-time-pad.ipynb"

install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Notebooks"
cp files/* "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Notebooks/"

# install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop"
# install -v -o 1000 -g 1000 -m 644 "one-time-pad.ipynb" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/"

# install -v -o 1000 -g 1000 -m 644 "ohio.jpg" "${ROOTFS_DIR}/usr/share/rpd-wallpaper/temple.jpg"

cp ohio.jpg "${ROOTFS_DIR}/usr/share/rpd-wallpaper/temple.jpg"

rm "${ROOTFS_DIR}/etc/xdg/autostart/piwiz.desktop"

# ln -sv "/lib/systemd/system/apply_noobs_os_config.service" "$ROOTFS_DIR/etc/systemd/system/multi-user.target.wants/apply_noobs_os_config.service"
