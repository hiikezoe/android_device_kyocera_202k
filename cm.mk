## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := 202k

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/kyocera/202k/device_202k.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := 202k
PRODUCT_NAME := cm_202k
PRODUCT_BRAND := kyocera
PRODUCT_MODEL := 202k
PRODUCT_MANUFACTURER := kyocera
