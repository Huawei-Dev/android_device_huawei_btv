#!/vendor/bin/sh

if [ ! -f /data/vendor/bluedroid/macbt ]; then
mount -o remount,rw /vendor
exec /vendor/bin/hw/mac_nvme
mount -o remount,ro /vendor
fi
