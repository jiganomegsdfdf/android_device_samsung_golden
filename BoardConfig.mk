#
# Copyright (C) 2013 The Android Open Source Project
# Copyright (C) 2013 Óliver García Albertos (oliverarafo@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_SPECIFIC_HEADER_PATH := device/samsung/golden/include
TARGET_OTA_ASSERT_DEVICE := golden,i8190,GT-I8190
# Board
TARGET_BOOTLOADER_BOARD_NAME := DB8520H
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
#TARGET_NO_RECOVERY := true
BOARD_USES_STE_HARDWARE := true
TARGET_USES_LEGACY_ADB_INTERFACE := true

# Platform
TARGET_BOARD_PLATFORM := montblanc
TARGET_SOC := u8500
MALLOC_SVELTE := true
#BOARD_GLOBAL_CFLAGS += -DUSING_MALI400=1

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
ARCH_ARM_HAVE_NEON := true
BOARD_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
BOARD_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

#TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
#	/system/bin/hwservicemanager=22 \
#	/system/bin/vold=22

# Apexes
TARGET_FLATTEN_APEX := true

# Build system
BUILD_BROKEN_DUP_RULES := true
TEMPORARY_DISABLE_PATH_RESTRICTIONS := true
#BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_FULL_RECOVERY_IMAGE := true
TARGET_HAS_MEMFD_BACKPORT := true
NEED_KERNEL_MODULE_SYSTEM := true
TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true


TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /vendor/bin/hw/rild=22 \
    /system/vendor/lib/libsec-ril.so=22 \
    /system/lib/libsecnativefeature.so=22 \
    /system/lib/libomission_avoidance.so=22 \
    /system/lib/libfactoryutil.so=22 \
    /system/vendor/lib/libakm.so=22 \
    /system/vendor/lib/libsecril-client.so=22 \
    /system/vendor/lib/hw/gps.exynos4.vendor.so=22 \
    /system/vendor/bin/glgps=22
	
TARGET_FS_CONFIG_GEN := device/samsung/golden/config.fs

# Network Routing
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

BOARD_ROOT_EXTRA_FOLDERS := \
	uid_0 \
	uid_1000 \
	uid_1020 \
	uid_1036 \
	uid_9999 \
	uid_1001 \
	uid_1013 \
	uid_1041 \
	uid_1010 \
	uid_1072 \
	uid_1069 \
	acct \
	tmp \
	debug \
	efs


# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Cache partition
BOARD_CACHEIMAGE_PARTITION_SIZE := 866951168      # 846632 * 1024 mmcblk0p23
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Userdata partition
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5064605696
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_HAS_LARGE_FILESYSTEM := true

# Vendor partition
#BOARD_VENDORIMAGE_PARTITION_SIZE := 335544320      # 327680 * 1024 mmcblk0p24
#BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := f2fs
#BOARD_USES_VENDORIMAGE := true
TARGET_COPY_OUT_VENDOR := system/vendor

# Kernel
TARGET_KERNEL_CONFIG := golden_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/golden
BOARD_KERNEL_CMDLINE += enforcing=0 androidboot.selinux=permissive root=/dev/ram0 rw
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_IMAGE_NAME := zImage
# Use GCC 4.7
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.7
KERNEL_TOOLCHAIN := "/home/nni16/golden/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin"

# Memory management
MALLOC_SVELTE := true

# External apps on SD
TARGET_EXTERNAL_APPS = sdcard1

# Releasetools
#TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/golden

# Blobs
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
BOARD_USES_LEGACY_MMAP := true
TARGET_ENABLE_NON_PIE_SUPPORT := true
TARGET_NEEDS_PRELINK_SUPPORT := true

# Ramdisk
#TARGET_PROVIDES_ENVIRON_RC := true

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/golden/configs/lib/egl/egl.cfg
BOARD_EGL_NEEDS_FNW := true
BOARD_EGL_NEEDS_HANDLE_VALUE := true
#BOARD_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH -DTARGET_NEEDS_HWC_V0
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true
TARGET_NUPLAYER_CANNOT_SET_SURFACE_WITHOUT_A_FLUSH := true
BOARD_USES_LEGACY_ACQUIRE_WVM := true

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOT_ANIMATION_RES := 480

# Screen
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH := "/system/vendor/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/wifi/bcmdhd_p2p.bin"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
BOARD_NO_APSME_ATTR := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/golden/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/samsung/golden/bluetooth/vnd_golden.txt

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/golden/ril/
#BOARD_GLOBAL_CFLAGS += -DSAMSUNG_PROPRIETARY_RIL_WORKAROUND
#BOARD_PROVIDES_LIBRIL := true
#BOARD_PROVIDES_RILD := true

# Browser
ENABLE_WEBGL := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
#BOARD_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB -DMR1_AUDIO_BLOB -DBOARD_CANT_REALLOCATE_OMX_BUFFERS
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true
USE_LEGACY_AUDIO_POLICY := 1
BOARD_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB -DMR1_AUDIO_BLOB
BOARD_GLOBAL_CFLAGS += -DHAVE_PRE_KITKAT_AUDIO_POLICY_BLOB
BOARD_GLOBAL_CFLAGS += -DHAVE_PRE_KITKAT_AUDIO_BLOB
USE_LEGACY_LOCAL_AUDIO_HAL := true
BOARD_USES_LEGACY_MMAP := true
USE_XML_AUDIO_POLICY_CONF := 1






# Vold
#BOARD_VOLD_MAX_PARTITIONS := 25
#BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
#BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
TARGET_USES_EXFAT := true

#init
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging


# Charging mode
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BACKLIGHT_PATH := /sys/class/backlight/panel/brightness
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/batt_lp_charging
BOARD_LPM_BOOT_ARGUMENT_NAME := lpm_boot
BOARD_LPM_BOOT_ARGUMENT_VALUE := 1

# Recovery
RECOVERY_VARIANT := twrp
BOARD_UMS_LUNFILE := "/sys/devices/platform/musb-ux500.0/musb-hdrc/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/musb-ux500.0/musb-hdrc/gadget/lun%d/file"
TARGET_RECOVERY_FSTAB := device/samsung/golden/rootdir/fstab.samsunggolden
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_CANT_BUILD_RECOVERY_FROM_BOOT_PATCH := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
RECOVERY_FSTAB_VERSION := 2
BOARD_HAS_DOWNLOAD_MODE := true

TARGET_RECOVERY_FSTAB := device/samsung/golden/rootdir/fstab.samsunggolden
RECOVERY_FSTAB_VERSION := 2
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_UMS_LUNFILE := "/sys/devices/platform/musb-ux500.0/musb-hdrc/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/musb-ux500.0/musb-hdrc/gadget/lun%d/file"


# SELinux
BOARD_SEPOLICY_DIRS += \
	device/samsung/golden/selinux
SELINUX_IGNORE_NEVERALLOWS := true
BOARD_SEPOLICY_VERS := $(PLATFORM_SDK_VERSION).0

#USE_CLANG_PLATFORM_BUILD = false

BLOCK_BASED_OTA := false
KERNEL_HAS_FINIT_MODULE := false
NO_FINIT_MODULE := true
WITH_SU := true
KERNEL_MISSING_CLOCK_BOOTTIME_ALARM := true

#camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_USES_NON_TREBLE_CAMERA := true

TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_BOOTANIMATION_PRELOAD := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_PHONY_TARGETS := true

OVERRIDE_TARGET_FLATTEN_APEX := true
DEXPREOPT_GENERATE_APEX_IMAGE := false
DEXPREOPT_USE_APEX_IMAGE := false

# Bionic
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true


TARGET_SYSTEM_PROP := device/samsung/golden/system.prop