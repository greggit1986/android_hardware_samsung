LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	SEC_OMX_Mpeg4dec.c \
	library_register.c

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := libOMX.SEC.M4V.Decoder
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/omx
LOCAL_VENDOR_MODULE := true

LOCAL_CFLAGS := -Wno-error

ifeq ($(BOARD_NONBLOCK_MODE_PROCESS), true)
LOCAL_CFLAGS += -DNONBLOCK_MODE_PROCESS
endif

ifeq ($(BOARD_USE_ANB), true)
LOCAL_CFLAGS += -DUSE_ANB
ifeq ($(BOARD_USE_CSC_FIMC), true)
ifeq ($(BOARD_USE_V4L2_ION), false)
LOCAL_CFLAGS += -DUSE_CSC_FIMC
endif
endif
endif

LOCAL_ARM_MODE := arm

LOCAL_STATIC_LIBRARIES := libSEC_OMX_Vdec libsecosal libsecbasecomponent \
	libseccscapi
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libutils libui liblog \
	libSEC_OMX_Resourcemanager

LOCAL_HEADER_LIBRARIES := libseccscapi_headers

ifeq ($(TARGET_SOC),exynos4x12)
LOCAL_SHARED_LIBRARIES += libsecmfcdecapi libsecmfcencapi
LOCAL_HEADER_LIBRARIES += libsecmfcdecapi_headers libsecmfcencapi_headers
else
LOCAL_STATIC_LIBRARIES += libsecmfcapi
LOCAL_HEADER_LIBRARIES += libsecmfcapi_headers
endif

ifeq ($(filter-out exynos4,$(TARGET_BOARD_PLATFORM)),)
LOCAL_SHARED_LIBRARIES += libhwconverter
endif

#ifeq ($(BOARD_USE_V4L2_ION),true)
#LOCAL_SHARED_LIBRARIES += libion
#endif

LOCAL_C_INCLUDES := $(SEC_OMX_INC)/khronos \
	$(SEC_OMX_INC)/sec \
	$(SEC_OMX_TOP)/osal \
	$(SEC_OMX_TOP)/core \
	$(SEC_OMX_COMPONENT)/common \
	$(SEC_OMX_COMPONENT)/video/dec

include $(BUILD_SHARED_LIBRARY)
