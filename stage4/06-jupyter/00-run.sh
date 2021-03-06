#!/bin/bash -e

# install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/"
# install -m 644 one-time-pad.ipynb "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/one-time-pad.ipynb"


install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop"
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Notebooks"
rm -fv "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Notebooks/*"
cp -fv files/* "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Notebooks/"

install -v -o 1000 -g 1000 -m 755 "Jupyter.desktop" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Jupyter.desktop"
install -v -o 1000 -g 1000 -m 755 "OHIO-EECS.desktop" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/OHIO-EECS.desktop"
install -v -o 1000 -g 1000 -m 755 "Russ-College.desktop" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/Russ-College.desktop"
install -v -o 1000 -g 1000 -m 755 "README-FIRST.pdf" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/README-FIRST.pdf"

install -v -o 1000 -g 1000 -m 644 "ohio.jpg" "${ROOTFS_DIR}/usr/share/rpd-wallpaper/temple.jpg"

# cp ohio.jpg "${ROOTFS_DIR}/usr/share/rpd-wallpaper/temple.jpg"

if [[ -f "${ROOTFS_DIR}/etc/xdg/autostart/piwiz.desktop" ]]; then
	rm "${ROOTFS_DIR}/etc/xdg/autostart/piwiz.desktop"
fi

cp -fv jupyter.service "${ROOTFS_DIR}/lib/systemd/system/jupyter.service"
ln -sfv "${ROOTFS_DIR}/lib/systemd/system/jupyter.service" "$ROOTFS_DIR/etc/systemd/system/multi-user.target.wants/jupyter.service"

cp -fv ohiosplash.png "${ROOTFS_DIR}/usr/share/plymouth/themes/pix/splash.png"

on_chroot << EOF
pip3 install --upgrade matplotlib
pip3 install --upgrade pillow
pip3 install --upgrade blinkt
pip3 install --upgrade BitVector

EOF

install -v -m 644 "libfm.conf" "${ROOTFS_DIR}/etc/xdg/libfm/libfm.conf"

cp -rfv blinkt-examples "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop"