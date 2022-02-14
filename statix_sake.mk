#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# All components inherited here go to the system image.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)

# All components inherited here go to the system_ext image.
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

# All components inherited here go to the product image.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_product.mk)

# All components inherited here go to the vendor image.
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_vendor.mk)

# All components inherited here are for the device specific configuration.
$(call inherit-product, device/asus/sake/device.mk)

# All components inherited here are for the StatiX specific configuration.
$(call inherit-product, vendor/statix/config/common.mk)
$(call inherit-product, vendor/statix/config/gsm.mk)

PRODUCT_BRAND := asus
PRODUCT_DEVICE := sake
PRODUCT_MANUFACTURER := asus
PRODUCT_MODEL := ASUS_I006D
PRODUCT_NAME := statix_sake

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=ASUS_I006D \
    TARGET_PRODUCT=WW_I006D

BUILD_FINGERPRINT := asus/WW_I006D/ASUS_I006D:12/SKQ1.210821.001/31.1004.0404.81:user/release-keys
