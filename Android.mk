include $(CLEAR_VARS)

LOCAL_MODULE := firmware
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := FAKE

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): $(LOCAL_ADDITIONAL_DEPENDENCIES)
	mkdir -p $(TARGET_OUT)/etc/firmware
	touch $(TARGET_OUT)/etc/firmware/dummy
	mkdir -p $(dir $@)firmware
