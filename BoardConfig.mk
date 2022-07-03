#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/asus/sake

include build/make/target/board/BoardConfigMainlineCommon.mk

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_dlkm \
    vendor_boot

# AVB
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

# Audio
AUDIO_FEATURE_ENABLED_DYNAMIC_LOG := false
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := false

# Biometrics
TARGET_SURFACEFLINGER_UDFPS_LIB := //$(DEVICE_PATH):libudfps_extension.sake

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := lahaina

# DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)

# DTBO
BOARD_USES_DT := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(TARGET_KERNEL_DIR)
BOARD_PREBUILT_DTBOIMAGE := $(BOARD_PREBUILT_DTBIMAGE_DIR)/dtbo.img

# Display
include hardware/qcom-caf/sm8350/display/config/display-board.mk

SOONG_CONFIG_qtidisplay_udfps := true
TARGET_SCREEN_DENSITY := 440

# FSConfig
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/hidl/asus_framework_matrix.xml \
    $(DEVICE_PATH)/hidl/device_framework_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    vendor/nxp/nfc/vendor_framework_compatibility_matrix.xml \
    vendor/nxp/secure_element/vendor_framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE := \
    $(DEVICE_PATH)/hidl/asus_manifest.xml \
    $(DEVICE_PATH)/hidl/manifest.xml

DEVICE_MATRIX_FILE := \
    $(DEVICE_PATH)/hidl/compatibility_matrix.xml

ODM_MANIFEST_SKUS := eSE
ODM_MANIFEST_ESE_FILES := $(DEVICE_PATH)/hidl/eSE_manifest.xml

# Hacks
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Kernel
TARGET_NO_KERNEL_OVERRIDE := true
TARGET_NO_KERNEL := false

BOARD_KERNEL_CMDLINE := \
    androidboot.console=ttyMSM0 \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    cgroup.memory=nokmem,nosocket \
    console=ttyMSM0,115200n8 \
    ip6table_raw.raw_before_defrag=1 \
    iptable_raw.raw_before_defrag=1 \
    loop.max_part=7 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    pcie_ports=compat \
    service_locator.enable=1 \
    swiotlb=0

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_RAMDISK_USE_LZ4 := true

BOARD_KERNEL_IMAGE_NAME := Image
BOARD_USES_GENERIC_KERNEL_IMAGE := true

KERNEL_MODULE_DIR := $(TARGET_KERNEL_DIR)
KERNEL_MODULES := $(wildcard $(KERNEL_MODULE_DIR)/*.ko)
BOARD_VENDOR_KERNEL_MODULES := $(KERNEL_MODULES)

# Partitions
BOARD_ASUS_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor vendor_dlkm
BOARD_ASUS_DYNAMIC_PARTITIONS_SIZE := 7512192768 # BOARD_SUPER_PARTITION_SIZE - 4MB
BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true
BOARD_SUPER_PARTITION_GROUPS := asus_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 7516192768

BOARD_ROOT_EXTRA_FOLDERS += batinfo

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x6000000
BOARD_DTBOIMG_PARTITION_SIZE := 0x1800000
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := $(BOARD_BOOTIMAGE_PARTITION_SIZE)

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := $(PRODUCT_RO_FILE_SYSTEM)
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := $(PRODUCT_RO_FILE_SYSTEM)
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := $(PRODUCT_RO_FILE_SYSTEM)
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := $(PRODUCT_RO_FILE_SYSTEM)
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := $(PRODUCT_RO_FILE_SYSTEM)

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Platform
TARGET_BOARD_PLATFORM := lahaina

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOOT_KERNEL_MODULES := \
    $(TARGET_KERNEL_DIR)/focaltech_fts_zf.ko \
    $(TARGET_KERNEL_DIR)/msm_drm.ko \
    $(TARGET_KERNEL_DIR)/sensors_vcnl36866.ko

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.default
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 100
TARGET_USERIMAGES_USE_F2FS := true

# SELinux
include device/qcom/sepolicy_vndr/SEPolicy.mk

BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public

# WLAN
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := $(BOARD_HOSTAPD_DRIVER)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := $(BOARD_HOSTAPD_PRIVATE_LIB)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB_EVENT := "ON"
HOSTAPD_VERSION := VER_0_8_X
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WPA_SUPPLICANT_VERSION := $(HOSTAPD_VERSION)

CONFIG_ACS := true
CONFIG_FST := true
CONFIG_IEEE80211AC := true
CONFIG_IEEE80211AX := true
CONFIG_MBO := true
CONFIG_OCV := true
CONFIG_OWE := true
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
