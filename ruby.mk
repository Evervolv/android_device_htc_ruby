#
# Copyright (C) 2011 The Evervolv Project
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

DEVICE_PACKAGE_OVERLAYS += device/htc/ruby/overlay
PRODUCT_LOCALES += en

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

# Dalvik
include frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk

# USB
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage \
    persist.service.adb.enable=1

#
# Packages required for ruby
#

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# Hostapd
PRODUCT_PACKAGES += \
    hostapd.conf \
    dhcpcd.conf \
    hostapd_cli \
    calibrator \
    hostapd

#PRODUCT_PACKAGES += \
#    libmlplatform \
#    libmllite \
#    libmpl

# Ramdisk (ks/qcks copied from vendor)
PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/root/cwkeys:root/cwkeys \
    device/htc/ruby/prebuilt/root/init.qcom.sh:root/init.qcom.sh \
    device/htc/ruby/prebuilt/root/init.ruby.rc:root/init.ruby.rc \
    device/htc/ruby/prebuilt/root/init.ruby.usb.rc:root/init.ruby.usb.rc \
    device/htc/ruby/prebuilt/root/ueventd.ruby.rc:root/ueventd.ruby.rc

# Boot scripts
PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/htc/ruby/prebuilt/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    device/htc/ruby/prebuilt/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/htc/ruby/prebuilt/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    device/htc/ruby/prebuilt/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh

# Configs
PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    device/htc/ruby/prebuilt/etc/spn-conf.xml:system/etc/spn-conf.xml \
    device/htc/ruby/prebuilt/etc/voicemail-conf.xml:system/etc/voicemail-conf.xml

# Idc
PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/ruby/prebuilt/usr/idc/ruby-keypad.idc:system/usr/idc/ruby-keypad.idc \

# Keychars
PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/usr/keychars/ruby-keypad.kcm:system/usr/keychars/ruby-keypad.kcm

# Keylayout
PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/ruby/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/ruby/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/ruby/prebuilt/usr/keylayout/ruby-keypad.kl:system/usr/keylayout/ruby-keypad.kl

# Kernel Modules
ifeq (,$(BUILD_KERNEL))
PRODUCT_COPY_FILES += $(shell \
    find device/htc/ruby/prebuilt/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')
endif

# Default permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# recovery charge mode support
include device/htc/ruby/recovery/recovery.mk

# media profiles and capabilities spec
$(call inherit-product, device/htc/ruby/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/ruby/media_htcaudio.mk)

# common msm8660 stuff
$(call inherit-product, device/htc/msm8660-common/msm8660.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/ruby/ruby-vendor.mk)
