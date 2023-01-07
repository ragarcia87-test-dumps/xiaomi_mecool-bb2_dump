#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hertz device
$(call inherit-product, device/droidlogic/hertz/device.mk)

PRODUCT_DEVICE := hertz
PRODUCT_NAME := omni_hertz
PRODUCT_BRAND := Droidlogic
PRODUCT_MODEL := hertz
PRODUCT_MANUFACTURER := droidlogic

PRODUCT_GMS_CLIENTID_BASE := android-droidlogic

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="hertz-userdebug 9 PPR1.180610.011 20200711 test-keys"

BUILD_FINGERPRINT := Droidlogic/hertz/hertz:9/PPR1.180610.011/20200711:userdebug/test-keys
