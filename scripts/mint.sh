#!/bin/bash
# Startup script to run on Mint Cinnamon

set -euxo pipefail

# Set up calibration for Wacom tablet
xinput set-prop "Wacom HID 48ED Pen stylus" "Coordinate Transformation Matrix" 0.999306 0 -0.001492 0 1.025641 -0.000627 0 0 1
xinput set-prop "Wacom HID 48ED Pen eraser" "Coordinate Transformation Matrix" 0.999306 0 -0.001492 0 1.025641 -0.000627 0 0 1


# Mount Google Drive
# NOTE: This is not needed anymore because Mint Cinammon has built in G-drive support
# rclone mount --vfs-cache-mode full --daemon gdrive: /mnt/gdrive
