#!/bin/bash
cd /opt/centos-remaster && mkisofs -o /opt/centos-remaster.iso -b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -V "CentOS 7 x86_64" -R -J -v -T isolinux/. . && implantisomd5 ../centos-remaster.iso

