#
# Copyright (C) 2020 The LineageOS Project
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

LOCAL_PATH := device/huawei/btv

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HIGH_OPTIMIZATION := true
TARGET_USES_64_BIT_BINDER := true

TARGET_BOARD_PLATFORM := hi3650
BOARD_VENDOR_PLATFORM := hi3650
HISI_TARGET_PRODUCT := hi3650

# Enable CPUSETS
ENABLE_CPUSETS := true

# Enable SCHEDBOOST
ENABLE_SCHEDBOOST := true

# Assert
TARGET_OTA_ASSERT_DEVICE := hi3650,btv,BTV,BTV-DL09,BTV-W09

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_GENERIC_AUDIO := false
BOARD_SUPPORTS_SOUND_TRIGGER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hi3650
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger 
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH := /sys/class/leds/lcd_backlight0/brightness

# CMHW
BOARD_HARDWARE_CLASS := \
    $(LOCAL_PATH)/cmhw \
    hardware/cyanogen/cmhw
    
### FONTS
EXTENDED_FONT_FOOTPRINT := true

# Display
USE_OPENGL_RENDERER := true
TARGET_HARDWARE_3D := true
ANDROID_ENABLE_RENDERSCRIPT := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USES_ION := true

# GPS
USE_DEVICE_SPECIFIC_GPS := true
TARGET_NO_RPC := true

# HWUI
HWUI_COMPILE_SYMBOLS := true

# Kernel
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x00478000
BOARD_KERNEL_CMDLINE := loglevel=4 page_tracker=on slub_min_objects=12 unmovable_isolate1=2:192M,3:224M,4:256M androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x07b88000 --tags_offset 0x07588000
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_HEADER_ARCH := arm64
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_KERNEL_SOURCE := kernel/huawei/btv
TARGET_KERNEL_CONFIG := hisi_3650_defconfig

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2080374784
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26935787520 #(26935820288 - 32768)
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_VENDORIMAGE_PARTITION_SIZE   := 637534208
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_FLASH_BLOCK_SIZE := 131072

# Properties
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.hi3650
TARGET_RECOVERY_DEVICE_MODULES := libinit_hi3650

# RIL
BOARD_PROVIDES_RILD := true
BOARD_PROVIDES_LIBRIL := true
TARGET_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
BOARD_RIL_CLASS := ../../../device/huawei/btv/ril
PROTOBUF_SUPPORTED := true
TARGET_RIL_VARIANT := proprietary

# Enable WEBGL
ENABLE_WEBGL := true

# Vendor
TARGET_COPY_OUT_VENDOR := vendor

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_hi3650
TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_btv.cpp

# Sepolicy
BOARD_SEPOLICY_DIRS += device/huawei/btv/sepolicy

# Wifi
WPA_SUPPLICANT_VERSION         := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER 	:= NL80211
BOARD_HOSTAPD_DRIVER 		:= NL80211
CONFIG_DRIVER_NL80211		:= y

# inherit from the proprietary version
-include vendor/huawei/btv/BoardConfigVendor.mk
