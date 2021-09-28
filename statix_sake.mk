#
# Copyright (C) 2021 StatiXOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/asus/sake/device.mk)

# Inherit some common StatiX stuff.
$(call inherit-product, vendor/statix/config/common.mk)
$(call inherit-product, vendor/statix/config/gsm.mk)

PRODUCT_BRAND := asus
PRODUCT_DEVICE := sake
PRODUCT_MANUFACTURER := ASUS
PRODUCT_MODEL := StatiXOS on ZenFone 8
PRODUCT_NAME := statix_sake

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=ASUS_I006D \
    PRODUCT_NAME=WW_I006D

BUILD_FINGERPRINT := asus/WW_I006D/ASUS_I006D:11/RKQ1.201022.002/30.12.112.22:user/release-keys