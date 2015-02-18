LOCAL_PATH := device/kyocera/202k

PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
  $(LOCAL_PATH)/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
  $(LOCAL_PATH)/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
  $(LOCAL_PATH)/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm
