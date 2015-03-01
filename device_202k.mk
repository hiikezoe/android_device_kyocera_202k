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
  $(LOCAL_PATH)/rootdir/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
  $(LOCAL_PATH)/rootdir/init.kc.firmware_links.sh:system/etc/init.kc.firmware_links.sh \
  $(LOCAL_PATH)/rootdir/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
  $(LOCAL_PATH)/rootdir/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \

PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
  $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
  $(LOCAL_PATH)/configs/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x

PRODUCT_COPY_FILES += \
  frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf \
  frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
  frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
  frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
  frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
  frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
  frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
  frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
  frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
  frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
  frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
  frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
  frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
  frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

$(call inherit-product, $(LOCAL_PATH)/idc/idc.mk)
$(call inherit-product, $(LOCAL_PATH)/keylayout/keylayout.mk)
$(call inherit-product, $(LOCAL_PATH)/keychars/keychars.mk)

$(call inherit-product, build/target/product/full.mk)

PRODUCT_PACKAGES += \
  firmware

PRODUCT_PACKAGES += \
  libgenlock \
  libmemalloc \
  liboverlay \
  copybit.msm8960 \
  gralloc.msm8960 \
  hwcomposer.msm8960 \
  memtrack.msm8960 \
  libqdutils \
  libtilerenderer

PRODUCT_PACKAGES += \
  lights.msm8960 \
  local_time.default \
  power.default \

#PRODUCT_PACKAGES += \
#  libdashplayer \
#  libOmxCore \
#  libOmxVdec \
#  libOmxVenc \
#  libOmxAacEnc \
#  libOmxAmrEnc \
#  libOmxEvrcEnc \
#  libOmxQcelp13Enc \
#  libstagefrighthw

PRODUCT_PACKAGES += \
  audio.a2dp.default \
  audio_policy.msm8960 \
  audio.primary.msm8960 \
  audio.r_submix.default \
  audio.usb.default \
  libaudioutils

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_202k
PRODUCT_DEVICE := 202k

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
