#!/usr/bin/env bash
set -Eeuo pipefail

echo "❯ Starting QEMU for Docker v$(</run/version)..."
echo "❯ For support visit https://github.com/qemu-tools/qemu-docker/"

cd /run

. reset.sh      # Initialize system
. install.sh    # Get bootdisk
. disk.sh       # Initialize disks
. display.sh    # Initialize graphics
. network.sh    # Initialize network
. boot.sh       # Configure boot
. proc.sh       # Initialize processor
. config.sh     # Configure arguments

trap - ERR
info "Booting image using $VERS..."

boot_cmd="exec qemu-system-x86_64 ${ARGS:+ $ARGS}"
echo "/tmp/boot_cmd.sh: boot_cmd=$boot_cmd"
echo $boot_cmd > /tmp/boot_cmd.sh
chmod uga+x /tmp/boot_cmd.sh
[[ "$DEBUG" == [Yy1]* ]] && set -x
/tmp/boot_cmd.sh
