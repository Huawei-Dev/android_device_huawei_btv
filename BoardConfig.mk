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

DEVICE_PATH := device/huawei/btv

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
UILD_BROKEN_USES_BUILD_COPY_HEADERS := true

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

TARGET_BOARD_PLATFORM := hi3650
TARGET_BOARD_PLATFORM_GPU := Mali-T880
BOARD_VENDOR_PLATFORM := hi3650

# Assert
TARGET_OTA_ASSERT_DEVICE := hi3650,btv,BTV-DL09,BTV-L0J,BTV-W09

# Android Q
BUILD_BROKEN_DUP_RULES := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hi3650
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
MALLOC_SVELTE_FOR_LIBC32 := true

# Charger 
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH := /sys/class/leds/lcd_backlight0/brightness

# Display
TARGET_SCREEN_DENSITY := 420

# Encryption
TARGET_PROVIDES_KEYMASTER := true

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/prebuilts/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/prebuilts/compatibility_matrix.xml

# Kernel
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x00478000
BOARD_KERNEL_CMDLINE := loglevel=6 page_tracker=on slub_min_objects=12 unmovable_isolate1=2:192M,3:224M,4:256M androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x07b88000 --tags_offset 0x07588000
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_KERNEL_SOURCE := kernel/huawei/btv
TARGET_KERNEL_CONFIG := hisi_3650_defconfig
TARGET_KERNEL_VERSION := 4.4

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2080374784
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26935787520 #(26935820288 - 32768)
BOARD_VENDORIMAGE_PARTITION_SIZE   := 637534208

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_VENDOR := vendor

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USES_MKE2FS := true

BOARD_ROOT_EXTRA_FOLDERS :=  \
	splash2 \
	3rdmodem \
	3rdmodemnvm \
	3rdmodemnvmbkp \
	sec_storage \
	modem_log \
	mnvm2:0 \
	produce

BOARD_ROOT_EXTRA_SYMLINKS += \
	/vendor/odm/hw_odm:/hw_odm
	
# Props
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.hi3650
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# RIL
ENABLE_VENDOR_RIL_SERVICE := true
BOARD_PROVIDES_LIBRIL := true

# Vendor Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_hi3650
TARGET_RECOVERY_DEVICE_MODULES := libinit_hi3650

# Sepolicy
BOARD_SEPOLICY_DIRS += device/huawei/btv/sepolicy
SELINUX_IGNORE_NEVERALLOWS := true

# Wifi
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true

# Vendor Security patch level
VENDOR_SECURITY_PATCH := 2023-10-06

# inherit from the proprietary version
-include vendor/huawei/btv/BoardConfigVendor.mk
