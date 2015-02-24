include $(CLEAR_VARS)

LOCAL_MODULE_PATH := $(TARGET_OUT)/etc
LOCAL_MODULE := firmware
LOCAL_MODULE_TAGS := optional
LOCAL_ADDITIONAL_DEPENDENCIES := mkdir

mkdir:
	mkdir -p $(TARGET_OUT)/etc/firmware

include $(BUILD_PHONY_PACKAGE)
