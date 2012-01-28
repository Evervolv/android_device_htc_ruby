# inherit from the proprietary version
-include vendor/htc/ruby/BoardConfigVendor.mk

USE_CAMERA_STUB := true

TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := ruby
TARGET_HAVE_HDMI_OUT := true
TARGET_USES_OVERLAY := true
TARGET_NO_RADIOIMAGE := true
TARGET_HAVE_TSLIB := false
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

TARGET_SPECIFIC_HEADER_PATH := device/htc/ruby/include

# Wifi related defines -- TODO: Move firmware to /vendor
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION := VER_0_6_X
BOARD_WLAN_DEVICE := 1283
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/tiwlan_drv.ko"
WIFI_DRIVER_FW_STA_PATH := "/system/etc/firmware/firmware.bin"
WIFI_DRIVER_FW_AP_PATH := "/system/etc/wifi/firmware_ap.bin"
WIFI_DRIVER_MODULE_NAME := "1283"

# Audio 
#BOARD_USES_GENERIC_AUDIO := false
#BOARD_PREBUILT_LIBAUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Gps
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := ruby
#BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Define egl.cfg location
BOARD_EGL_CFG := device/htc/ruby/prebuilt/system/lib/egl/egl.cfg
BOARD_USES_OVERLAY := true
#USE_OPENGL_RENDERER := true
#BOARD_USES_HGL := true

COMMON_GLOBAL_CFLAGS += \
    -DMISSING_EGL_EXTERNAL_IMAGE \
    -DMISSING_EGL_PIXEL_FORMAT_YV12 \
    -DMISSING_GRALLOC_BUFFERS

BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true

# Legacy touchscreen support
BOARD_USE_LEGACY_TOUCHSCREEN := true

#(temporary signal fix moved libril.so to full_ruby.mk)
#BOARD_USE_NEW_LIBRIL_HTC := true
#TARGET_PROVIDES_LIBRIL := vendor/htc/ruby/proprietary/libril.so

BOARD_KERNEL_CMDLINE := no_console_suspend=1
BOARD_KERNEL_BASE := 0x48000000
BOARD_PAGE_SIZE := 2048

# Define Prebuilt kernel locations
TARGET_PREBUILT_KERNEL := device/htc/ruby/prebuilt/root/kernel
# We use a recoverykernel
TARGET_PREBUILT_RECOVERY_KERNEL := device/htc/ruby/prebuilt/recovery/root/recoverykernel

# For recovery-chargemode
TARGET_RECOVERY_INITRC := device/htc/ruby/prebuilt/recovery/root/init.rc

# cat /proc/emmc
dev:        size     erasesize name
mmcblk0p24: 00fff600 00000200 "misc"
mmcblk0p23: 00fffc00 00000200 "recovery"
mmcblk0p22: 01000000 00000200 "boot"
mmcblk0p29: 5ffffc00 00000200 "system"
mmcblk0p30: 13fffe00 00000200 "cache"
mmcblk0p31: 9ffffe00 00000200 "userdata"
mmcblk0p32: 01fba800 00000200 "devlog"
mmcblk0p34: 00040000 00000200 "pdata"
mmcblk0p17: 02800000 00000200 "radio"
mmcblk0p21: 02000000 00000200 "adsp"
mmcblk0p19: 007ffc00 00000200 "radio_config"
mmcblk0p25: 00400000 00000200 "modem_st1"
mmcblk0p26: 00400000 00000200 "modem_st2"
mmcblk0p18: 02800000 00000200 "mdm9k"
mmcblk0p20: 007ffa00 00000200 "mdm9k_config"
mmcblk0p27: 00400000 00000200 "mdm_efs1"
mmcblk0p28: 00400000 00000200 "mdm_efs2"


TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 20044333056
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p36
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
#BOARD_CUSTOM_GRAPHICS:= ../../../device/htc/ruby/graphics.c
#BOARD_USES_RECOVERY_CHARGEMODE := true
