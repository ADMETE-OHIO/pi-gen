#!/bin/bash -e

# install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/"
# install -m 644 one-time-pad.ipynb "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/one-time-pad.ipynb"


install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop"
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Notebooks"
cp files/* "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Notebooks/"

install -v -o 1000 -g 1000 -m 755 "Jupyter.desktop" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Jupyter.desktop"

install -v -o 1000 -g 1000 -m 644 "ohio.jpg" "${ROOTFS_DIR}/usr/share/rpd-wallpaper/temple.jpg"

# cp ohio.jpg "${ROOTFS_DIR}/usr/share/rpd-wallpaper/temple.jpg"

if [[ -f "${ROOTFS_DIR}/etc/xdg/autostart/piwiz.desktop" ]]; then
	rm "${ROOTFS_DIR}/etc/xdg/autostart/piwiz.desktop"
fi

cp jupyter.service "${ROOTFS_DIR}/lib/systemd/system/jupyter.service"
ln -sfv "${ROOTFS_DIR}/lib/systemd/system/jupyter.service" "$ROOTFS_DIR/etc/systemd/system/multi-user.target.wants/jupyter.service"

on_chroot << EOF
pip3 install --upgrade matplotlib
pip3 install --upgrade pillow
pip3 install --upgrade blinkt
EOF

