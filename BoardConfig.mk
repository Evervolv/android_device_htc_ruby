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
# override dhd defines from msm8660-common
WIFI_BAND:=
WIFI_DRIVER_FW_PATH_AP:=
WIFI_DRIVER_FW_PATH_P2P:=
WIFI_DRIVER_FW_PATH_STA:=
WIFI_DRIVER_FW_PATH_PARAM:=
# end overrides

USE_CAMERA_STUB := true

TARGET_BOOTLOADER_BOARD_NAME := ruby
TARGET_NO_RADIOIMAGE := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Gps
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := ruby
#BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Enable NFC
BOARD_HAVE_NFC := true

BOARD_HAS_SCREEN_OFF_FLICKER := true
#BOARD_USE_SKIA_LCDTEXT := true

# Hardware Rendering
TARGET_USES_PMEM := true

#BOARD_USE_NEW_LIBRIL_HTC    := true
#BOARD_PROVIDES_LIBRIL       := vendor/htc/ruby/proprietary/libril.so
BOARD_PROVIDES_LIBRIL := true

BOARD_KERNEL_CMDLINE := no_console_suspend=1 androidboot.hardware=ruby
BOARD_KERNEL_BASE := 0x48000000
BOARD_KERNEL_PAGESIZE := 2048

# Connectivity - Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_wl12xx
BOARD_WLAN_DEVICE                := wl12xx_mac80211
BOARD_SOFTAP_DEVICE              := wl12xx_mac80211
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wl12xx_sdio.ko"
WIFI_DRIVER_MODULE_NAME          := "wl12xx_sdio"
WIFI_FIRMWARE_LOADER             := ""
COMMON_GLOBAL_CFLAGS += -DUSES_TI_MAC80211
#BOARD_SOFTAP_DEVICE_TI           := NL80211

# Define Prebuilt kernel locations
TARGET_PREBUILT_KERNEL := device/htc/ruby/prebuilt/root/kernel

BOARD_USES_MMCUTILS := true
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VOLD_MAX_PARTITIONS := 37
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
# BOOT     16M        16777216   0x01000000
# RECOVERY 15.999M    16776192   0x00fffc00
# SYSTEM   1.499999G  1610611712 0x5ffffc00
# USERDATA 2.4999995G 2684354048 0x9ffffe00
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1610611712
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2684354048
