LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libsecmfcapi
LOCAL_VENDOR_MODULE := true

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	dec/src/SsbSipMfcDecAPI.c \
	enc/src/SsbSipMfcEncAPI.c

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include/

LOCAL_PRELINK_MODULE := false
LOCAL_CFLAGS := -Wno-error

ifeq ($(BOARD_USES_MFC_FPS),true)
LOCAL_CFLAGS += -DCONFIG_MFC_FPS
#LOCAL_CFLAGS += -DCONFIG_MFC_PERF_ALOG
endif

ifeq ($(BOARD_USE_S3D_SUPPORT), true)
LOCAL_CFLAGS += -DS3D_SUPPORT
endif

LOCAL_ARM_MODE := arm

LOCAL_STATIC_LIBRARIES :=
LOCAL_SHARED_LIBRARIES := liblog libutils

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libsecmfcapi_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
include $(BUILD_HEADER_LIBRARY)

# Shared MFC Dec API

include $(CLEAR_VARS)

LOCAL_MODULE := libsecmfcdecapi
LOCAL_VENDOR_MODULE := true

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	dec/src/SsbSipMfcDecAPI.c

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include/

LOCAL_PRELINK_MODULE := false
LOCAL_CFLAGS := -Wno-error

ifeq ($(BOARD_USES_MFC_FPS),true)
LOCAL_CFLAGS += -DCONFIG_MFC_FPS
#LOCAL_CFLAGS += -DCONFIG_MFC_PERF_ALOG
endif

ifeq ($(BOARD_USE_S3D_SUPPORT), true)
LOCAL_CFLAGS += -DS3D_SUPPORT
endif

LOCAL_ARM_MODE := arm

LOCAL_STATIC_LIBRARIES :=
LOCAL_SHARED_LIBRARIES := liblog libutils

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libsecmfcdecapi_headers
LOCAL_VENDOR_MODULE := true
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
include $(BUILD_HEADER_LIBRARY)

# Shared MFC Enc API

include $(CLEAR_VARS)

LOCAL_MODULE := libsecmfcencapi
LOCAL_VENDOR_MODULE := true

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	enc/src/SsbSipMfcEncAPI.c

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include/

LOCAL_PRELINK_MODULE := false
LOCAL_CFLAGS := -Wno-error

ifeq ($(BOARD_USES_MFC_FPS),true)
LOCAL_CFLAGS += -DCONFIG_MFC_FPS
#LOCAL_CFLAGS += -DCONFIG_MFC_PERF_ALOG
endif

ifeq ($(BOARD_USE_S3D_SUPPORT), true)
LOCAL_CFLAGS += -DS3D_SUPPORT
endif

LOCAL_ARM_MODE := arm

LOCAL_STATIC_LIBRARIES :=
LOCAL_SHARED_LIBRARIES := liblog libutils

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libsecmfcencapi_headers
LOCAL_VENDOR_MODULE := true
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
include $(BUILD_HEADER_LIBRARY)
