#
# Copyright (C) 2009 The Android Open Source Project
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
#

# inherit from the proprietary version
-include vendor/htc/ruby/BoardConfigVendor.mk
# inherit common msm8660 defines
include device/htc/msm8660-common/BoardConfigCommon.mk

# override common stuff that wont build just yet
TARGET_QCOM_HDMI_OUT := false
TARGET_QCOM_HDMI_RESOLUTION_AUTO := false
COMMON_GLOBAL_CFLAGS += -UWITH_QCOM_LPA
TARGET_USES_QCOM_LPA := false
DYNAMIC_SHARED_LIBV8SO := false
# override dhd defines
WIFI_BAND :=
WPA_SUPPLICANT_VERSION :=
BOARD_WPA_SUPPLICANT_DRIVER :=
BOARD_WPA_SUPPLICANT_PRIVATE_LIB :=
BOARD_HOSTAPD_DRIVER :=
BOARD_HOSTAPD_PRIVATE_LIB :=
BOARD_WLAN_DEVICE :=
WIFI_DRIVER_FW_PATH_STA :=
WIFI_DRIVER_FW_PATH_AP :=
WIFI_DRIVER_FW_PATH_P2P :=
WIFI_DRIVER_FW_PATH_PARAM :=
WIFI_DRIVER_MODULE_NAME :=
WIFI_DRIVER_MODULE_PATH :=

USE_CAMERA_STUB := true

TARGET_BOOTLOADER_BOARD_NAME := ruby
TARGET_NO_RADIOIMAGE := true

# Gps
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := ruby
#BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Enable NFC
BOARD_HAVE_NFC := true

BOARD_HAS_SCREEN_OFF_FLICKER := true

# Legacy touchscreen support
BOARD_USE_LEGACY_TOUCHSCREEN := true

BOARD_USE_NEW_LIBRIL_HTC    := true
BOARD_PROVIDES_LIBRIL       := vendor/htc/ruby/proprietary/libril.so

BOARD_KERNEL_CMDLINE := no_console_suspend=1 androidboot.hardware=ruby
BOARD_KERNEL_BASE := 0x48000000
BOARD_PAGE_SIZE := 2048

# Define Prebuilt kernel locations
TARGET_PREBUILT_KERNEL := device/htc/ruby/prebuilt/root/kernel

# For recovery-chargemode
TARGET_RECOVERY_INITRC := device/htc/ruby/recovery/root/init.rc

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p24: 00fff600 00000200 "misc"
#mmcblk0p23: 00fffc00 00000200 "recovery"
#mmcblk0p22: 01000000 00000200 "boot"
#mmcblk0p29: 5ffffc00 00000200 "system"
#mmcblk0p30: 13fffe00 00000200 "cache"
#mmcblk0p31: 9ffffe00 00000200 "userdata"
#mmcblk0p32: 01fba800 00000200 "devlog"
#mmcblk0p34: 00040000 00000200 "pdata"
#mmcblk0p17: 02800000 00000200 "radio"
#mmcblk0p21: 02000000 00000200 "adsp"
#mmcblk0p19: 007ffc00 00000200 "radio_config"
#mmcblk0p25: 00400000 00000200 "modem_st1"
#mmcblk0p26: 00400000 00000200 "modem_st2"
#mmcblk0p18: 02800000 00000200 "mdm9k"
#mmcblk0p20: 007ffa00 00000200 "mdm9k_config"
#mmcblk0p27: 00400000 00000200 "mdm_efs1"
#mmcblk0p28: 00400000 00000200 "mdm_efs2"

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 20044333056
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 37

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p36
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
