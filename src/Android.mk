# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq ($(BUILD_LMBENCH),true)
LOCAL_PATH := $(call my-dir)
COMMON_CFLAGS := -DANDROID -DHAVE_uint
COMMON_LIBS := lmbench_lib
ANDROID_LMBENCH := true

# Build lmbench_lib
include $(CLEAR_VARS)

LOCAL_SRC_FILES := lib_unix.c lib_timing.c \
   	lib_mem.c lib_stats.c lib_debug.c getopt.c lib_sched.c
ifneq ($(ANDROID_LMBENCH),true)
	LOCAL_SRC_FILES := $(LOCAL_SRC_FILES) lib_tcp.c lib_udp.c
endif
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lmbench_lib

include $(BUILD_STATIC_LIBRARY)

#
# Build mhz on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= mhz.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := mhz

include $(BUILD_EXECUTABLE)

#
# Build bw_file_rd on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= bw_file_rd.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := bw_file_rd

include $(BUILD_EXECUTABLE)

#
# Build bw_mem on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= bw_mem.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := bw_mem

include $(BUILD_EXECUTABLE)

#
# Build bw_mmap_rd on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= bw_mmap_rd.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := bw_mmap_rd

include $(BUILD_EXECUTABLE)

#
# Build bw_pipe on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= bw_pipe.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := bw_pipe

include $(BUILD_EXECUTABLE)

ifneq ($(ANDROID_LMBENCH),true)
#
# Build bw_tcp on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= bw_tcp.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := bw_tcp

include $(BUILD_EXECUTABLE)
endif

#
# Build bw_unix on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= bw_unix.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := bw_unix

include $(BUILD_EXECUTABLE)

#
# Build lat_cmd on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_cmd.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_cmd

include $(BUILD_EXECUTABLE)

ifneq ($(ANDROID_LMBENCH),true)
#
# Build lat_connect on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_connect.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_connect

include $(BUILD_EXECUTABLE)
endif

#
# Build lat_ctx on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_ctx.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_ctx

include $(BUILD_EXECUTABLE)

#
# Build lat_fcntl on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_fcntl.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_fcntl

include $(BUILD_EXECUTABLE)

#
# Build lat_fs on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_fs.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_fs

include $(BUILD_EXECUTABLE)

#
# Build lat_mem_rd on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_mem_rd.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_mem_rd

include $(BUILD_EXECUTABLE)

#
# Build lat_mmap on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_mmap.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_mmap

include $(BUILD_EXECUTABLE)

#
# Build lat_ops on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_ops.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_ops

include $(BUILD_EXECUTABLE)

#
# Build lat_pipe on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_pipe.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_pipe

include $(BUILD_EXECUTABLE)

#
# Build lat_pagefault on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_pagefault.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_pagefault

include $(BUILD_EXECUTABLE)

#
# Build lat_proc on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_proc.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_proc

include $(BUILD_EXECUTABLE)

#
# Build lat_rand on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_rand.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_rand

include $(BUILD_EXECUTABLE)

ifneq ($(ANDROID_LMBENCH),true)
#
# Build lat_tcp on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_tcp.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_tcp

include $(BUILD_EXECUTABLE)
endif

ifneq ($(ANDROID_LMBENCH),true)
#
# Build lat_sem on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_sem.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_sem

include $(BUILD_EXECUTABLE)
endif

#
# Build lat_sig on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_sig.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_sig

include $(BUILD_EXECUTABLE)

#
# Build lat_syscall on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_syscall.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_syscall

include $(BUILD_EXECUTABLE)

ifneq ($(ANDROID_LMBENCH),true)
#
# Build lat_udp on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_udp.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_udp

include $(BUILD_EXECUTABLE)
endif

#
# Build lat_unix on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_unix.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_unix

include $(BUILD_EXECUTABLE)

#
# Build lat_usleep on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_usleep.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags) -DTRUE=1 -DFALSE=0
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_usleep

include $(BUILD_EXECUTABLE)

#
# Build cache on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= cache.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := cache

include $(BUILD_EXECUTABLE)

#
# Build line on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= line.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := line

include $(BUILD_EXECUTABLE)

#
# Build lmdd on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lmdd.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lmdd

include $(BUILD_EXECUTABLE)

#
# Build tlb on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= tlb.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := tlb

include $(BUILD_EXECUTABLE)

#
# Build stream on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= stream.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lmstream

include $(BUILD_EXECUTABLE)

#
# Build memsize on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= memsize.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := memsize

include $(BUILD_EXECUTABLE)

ifneq ($(ANDROID_LMBENCH),true)
#
# Build lat_select on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_select.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_select

include $(BUILD_EXECUTABLE)
endif

#
# Build lat_unix_connect on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_unix_connect.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_unix_connect

include $(BUILD_EXECUTABLE)

#
# Build lat_fifo on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_fifo.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_fifo

include $(BUILD_EXECUTABLE)

ifneq ($(ANDROID_LMBENCH),true)
#
# Build lat_http on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lat_http.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := lat_http

include $(BUILD_EXECUTABLE)
endif

#
# Build par_mem on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= par_mem.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := par_mem

include $(BUILD_EXECUTABLE)

#
# Build par_ops on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= par_ops.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := par_ops

include $(BUILD_EXECUTABLE)

#
# Build enough on target
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= enough.c
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(COMMON_CFLAGS) $(common_target_cflags)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := enough

include $(BUILD_EXECUTABLE)

endif
