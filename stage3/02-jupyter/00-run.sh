#!/bin/bash

# install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/"
# install -m 644 one-time-pad.ipynb "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/one-time-pad.ipynb"

install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Notebooks"
cp one-time-pad.ipynb "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Notebooks/"
