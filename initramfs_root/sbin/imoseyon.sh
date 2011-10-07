#!/system/bin/sh

if ! ls /system/bin/bootanimation
then
	cp -f /res/bootanimation /system/bin/bootanimation
fi
chmod 755 /system/bin/bootanimation

# install bln
mount -o rw,remount /system /system
cat /res/lights.s5pc110.so > /system/lib/hw/lights.s5pc110.so
chmod 755 /system/lib/hw/lights.s5pc110.so
#cat /res/lights.aries.so > /system/lib/hw/lights.aries.so
#chmod 644 /system/lib/hw/lights.aries.so
rm /system/lib/hw/lights.aries.so
mount -o ro,remount /system /system

# bootanimation hack
while [ 1 ]; do
  sleep 1;
  if pgrep android.process.acore; then
        sleep 5;
        busybox pkill bootanimation
        busybox pkill samsungani
        exit;
  fi
done 
