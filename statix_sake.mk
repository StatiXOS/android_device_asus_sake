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
PRODUCT_MANUFACTURER := asus
PRODUCT_MODEL := ASUS_I006D
PRODUCT_NAME := statix_sake

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=ASUS_I006D \
    TARGET_PRODUCT=WW_I006D

BUILD_FINGERPRINT := asus/WW_I006D/ASUS_I006D:12/SKQ1.210821.001/31.1004.0404.73:user/release-keys
