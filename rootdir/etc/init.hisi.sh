#!/vendor/bin/sh

if [ ! -f /system/lib64/vndk-29/libart.so ]; then
mount -o remount,rw /
ln -sf /system/apex/com.android.runtime.release/lib64/libart.so /system/lib64/vndk-29/libart.so
ln -sf /system/apex/com.android.runtime.release/lib64/libartbase.so /system/lib64/vndk-29/libartbase.so
ln -sf /system/apex/com.android.runtime.release/lib64/libartpalette.so /system/lib64/vndk-29/libartpalette.so
ln -sf /system/apex/com.android.runtime.release/lib64/libdexfile.so /system/lib64/vndk-29/libdexfile.so
ln -sf /system/lib64/libdl_android.so /system/lib64/vndk-29/libdl_android.so
ln -sf /system/apex/com.android.runtime.release/lib64/libnativebridge.so /system/lib64/vndk-29/libnativebridge.so
ln -sf /system/apex/com.android.runtime.release/lib64/libprofile.so /system/lib64/vndk-29/libprofile.so
ln -sf /system/apex/com.android.runtime.release/lib64/libsigchain.so /system/lib64/vndk-29/libsigchain.so
mount -o remount,ro /
fi
