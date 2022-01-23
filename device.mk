#
# Copyright (C) 2020-2023 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/huawei/btv

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/huawei/btv

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Additional native libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/cfg_btv_dcm_hisi.ini:$(TARGET_COPY_OUT_VENDOR)/etc/cfg_btv_dcm_hisi.ini \
    $(LOCAL_PATH)/prebuilts/cfg_btv_hisi.ini:$(TARGET_COPY_OUT_VENDOR)/etc/cfg_btv_hisi.ini \
    $(LOCAL_PATH)/prebuilts/cfg_btv_wifi_only_hisi.ini:$(TARGET_COPY_OUT_VENDOR)/etc/cfg_btv_wifi_only_hisi.ini
    
# APEX
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/ld.config.29.txt:$(TARGET_COPY_OUT_SYSTEM)/etc/ld.config.29.txt
    
# AAPT conf
PRODUCT_AAPT_CONFIG := normal 
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_CHARACTERISTICS := tablet

# Audio/Media
PRODUCT_PACKAGES += \
    audio.primary.default \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaacwrapper \
    libaudioutils \
    libaudioroute \
    libtinyalsa \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo
    
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.soundtrigger@2.0-impl \
    android.hardware.broadcastradio@1.0-impl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/prebuilts/audio_policy_volumes_drc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes_drc.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/prebuilts/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/prebuilts/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml
    
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml \
    $(LOCAL_PATH)/prebuilts/media_codecs_performance_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml
    
# BT
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.1-service
    
# config.fs
PRODUCT_PACKAGES += \
    fs_config_files
    
# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.2-service.clearkey
    
# Fingerprint sensor
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/native_packages.bin:$(TARGET_COPY_OUT_VENDOR)/etc/native_packages.bin
    
# Gralloc
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl
    
# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl    

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service
    
# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \
    lights.hi3650
    
# Lineage hardware
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.hi3650
    
# MAC Loader
PRODUCT_PACKAGES += \
    mac_nvme
    
# Media
PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0-service
    
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/prebuilts/topazhp.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/topazhp.cfg \
    $(LOCAL_PATH)/prebuilts/vdec_atlas.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/vdec_atlas.cfg

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service
    
# Misc
PRODUCT_PACKAGES += \
    libxcollie
    
# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-impl \
    android.hardware.power.stats@1.0-service.mock
    
# Ramdisk
PRODUCT_PACKAGES += \
    fstab.hi3650 \
    fstab.modem \
    fstab.zram1536m \
    fstab.zram2240m \
    init.charger.rc \
    init.chip.charger.rc \
    init.chip.usb.rc \
    init.hi3650.connectivity.rc \
    init.hi3650.hisi.rc \
    init.hi3650.lte.rc \
    init.hi3650.power.rc \
    init.hi3650.rc \
    init.hi3650.usb.configfs.rc \
    init.hi3650.usb.rc \
    init.hisi.sh \
    init.hwo.sh \
    init.recovery.hi3650.rc \
    init.safailnet.rc \
    ueventd.hi3650.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.ramdisk:$(TARGET_COPY_OUT_RAMDISK)/fstab.hi3650
    
# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl
    
# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio.config@1.1 \
    android.hardware.radio@1.1 \
    android.hardware.radio.deprecated@1.0 \
    librilutils \
    reference-ril \
    libprotobuf-cpp-full \
    libtinyxml \
    libxml2 \
    mploader
    
# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy
    
# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl
    
# Shims
PRODUCT_PACKAGES += \
    android.hardware.graphics.common@1.0_types.vendor \
    android.hardware.radio@1.0_types.vendor \
    liblog_vendor
    
PRODUCT_PACKAGES += \
    libstdc++.vendor
    
# TextClassifier smart selection model files
PRODUCT_PACKAGES += \
    textclassifier.bundle1

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service   

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic \
    com.android.future.usb.accessory

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service
    
# Vndk
PRODUCT_PACKAGES += \
    android.hidl.base@1.0
 
# Vr
PRODUCT_PACKAGES += \
    android.hardware.vr@1.0-impl \
    android.hardware.vr@1.0-service    

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1 \
    ro.magic.api.version=0.1 \
    ro.enable_boot_charger_mode=0 \
    persist.sys.usb.config=manufacture,adb \
    sys.usb.configfs=1 \
    sys.usb.controller=ff100000.dwc3
    
PRODUCT_GMS_CLIENTID_BASE := android-huawei

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.external.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.external.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.picture_in_picture.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.picture_in_picture.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.vr.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vr.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_0_3.xml

$(call inherit-product, vendor/huawei/btv/btv-vendor.mk)
