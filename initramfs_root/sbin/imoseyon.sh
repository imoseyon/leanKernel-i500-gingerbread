#!/system/bin/sh

# install bln
mount -o rw,remount /system /system
cat /res/lights.s5pc110.so > /system/lib/hw/lights.s5pc110.so
chmod 755 /system/lib/hw/lights.s5pc110.so
#cat /res/lights.aries.so > /system/lib/hw/lights.aries.so
#chmod 644 /system/lib/hw/lights.aries.so
mount -o ro,remount /system /system
