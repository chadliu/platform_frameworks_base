LOCAL_PATH:= $(call my-dir)

# Effect factory library
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	EffectsFactory.c

LOCAL_SHARED_LIBRARIES := \
	libcutils

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE:= libeffects

ifeq ($(TARGET_OS)-$(TARGET_SIMULATOR),linux-true)
LOCAL_LDLIBS += -ldl
endif

ifneq ($(TARGET_SIMULATOR),true)
LOCAL_SHARED_LIBRARIES += libdl
endif

LOCAL_C_INCLUDES := \

include $(BUILD_SHARED_LIBRARY)


# Default Reverb library
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	EffectReverb.c.arm \
	EffectsMath.c.arm
LOCAL_CFLAGS+= -O2

LOCAL_SHARED_LIBRARIES := \
	libcutils

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/soundfx
LOCAL_MODULE:= libreverb

ifeq ($(TARGET_OS)-$(TARGET_SIMULATOR),linux-true)
LOCAL_LDLIBS += -ldl
endif

ifneq ($(TARGET_SIMULATOR),true)
LOCAL_SHARED_LIBRARIES += libdl
endif

LOCAL_C_INCLUDES := \
	$(call include-path-for, graphics corecg)

LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

# Default Equalizer library
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	EffectsMath.c.arm \
	EffectEqualizer.cpp \
	AudioBiquadFilter.cpp.arm \
	AudioCoefInterpolator.cpp.arm \
	AudioPeakingFilter.cpp.arm \
	AudioShelvingFilter.cpp.arm \
	AudioEqualizer.cpp.arm

LOCAL_CFLAGS+= -O2

LOCAL_SHARED_LIBRARIES := \
	libcutils

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/soundfx
LOCAL_MODULE:= libequalizer

ifeq ($(TARGET_OS)-$(TARGET_SIMULATOR),linux-true)
LOCAL_LDLIBS += -ldl
endif

ifneq ($(TARGET_SIMULATOR),true)
LOCAL_SHARED_LIBRARIES += libdl
endif

LOCAL_C_INCLUDES := \
	$(call include-path-for, graphics corecg)

LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)