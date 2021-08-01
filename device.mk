#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# Initialization
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/recovery.fstab:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.default

PRODUCT_PACKAGES += \
    init.asus.recovery.rc

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    kernel/asus/sm8350

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_PACKAGES += \
    CarrierConfigResCommon \
    FrameworksResCommon \
    SystemUIResCommon \
    TelephonyResCommon \
    WifiResCommon \
    ZenFone8Frameworks \
    ZenFone8SystemUI

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Platform
PRODUCT_USES_QCOM_HARDWARE := true
PRODUCT_BOARD_PLATFORM := lahaina

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 30

# Vendor
$(call inherit-product, vendor/asus/sake/sake-vendor.mk)
