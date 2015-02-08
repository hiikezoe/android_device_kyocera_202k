$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/kyocera/202k/202k-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/kyocera/202k/overlay

LOCAL_PATH := device/kyocera/202k

PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
  $(LOCAL_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
  $(LOCAL_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_202k
PRODUCT_DEVICE := 202k

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
