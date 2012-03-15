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


PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en
DEVICE_PACKAGE_OVERLAYS += device/htc/ruby/overlay
# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/system/etc/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r5 \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.clientidbase.yt=android-htc \
    ro.com.google.clientidbase.am=android-tmobile-us \
    ro.com.google.clientidbase.vs=android-hms-tmobile-us \
    ro.com.google.clientidbase.gmm=android-htc \
    ro.com.google.clientidbase.ms=android-hms-tmobile-us \
    ro.setupwizard.enable_bypass=1 \
    ro.cdma.home.operator.numeric=310120 \
    ro.phone.min_match=7 \
    ro.ril.enable.dtm=0 \
    ro.ril.def.agps.mode=2 \
    ro.ril.gprsclass=12 \
    ro.ril.hsdpa.category=10 \
    ro.ril.hsupa.category=6 \
    ro.ril.hsxpa=3 \
    ro.telephony.default_network=0 \
    ro.telephony.ril.v3=signalstrength \
    ro.config.lte=true \
    telephony.lteOnCdmaDevice=0 \
    gsm.sim.operator.alpha=tmobile \
    gsm.sim.operator.numeric=310120 \
    gsm.sim.operator.iso-country=us \
    gsm.operator.alpha=tmobile \
    gsm.operator.numeric=310120 \
    gsm.operator.iso-country=us \
    wifi.interface=tiwlan0 \
    wifi.supplicant_scan_interval=45 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.sf.lcd_density=240

# Dalvik
include frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.composition.type=c2d \
    debug.qctwa.statusbar=1 \
    debug.qctwa.preservebuf=1 \
    com.qc.hardware=true
#    com.qc.hdmi_out=false \
#    debug.fb.rgb565 = 0 \
# so much breakage
#    ro.sf.compbypass.enable=1

# USB
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage \
    persist.service.adb.enable=1

PRODUCT_PACKAGES += \
    librs_jni \
    copybit.msm8660 \
    gralloc.msm8660 \
    hwcomposer.msm8660 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libQcomUI \
    libOmxCore \
    libOmxVidEnc \
    libOmxVdec \
    libstagefrighthw \
    libdivxdrmdecrypt \
    com.android.future.usb.accessory
# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs
# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras \
    nfc.ruby
# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm8660 \
    audio.primary.msm8660 \
    libaudioutils
#PRODUCT_PACKAGES += \
#    libmlplatform \
#    libmllite \
#    libmpl

# Ramdisk Files
PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/root/init.ruby.rc:root/init.ruby.rc \
    device/htc/ruby/prebuilt/root/ks:root/system/bin/ks \
    device/htc/ruby/prebuilt/root/qcks:root/system/bin/qcks \
    device/htc/ruby/prebuilt/root/init.ruby.usb.rc:root/init.ruby.usb.rc \
    device/htc/ruby/prebuilt/root/ueventd.ruby.rc:root/ueventd.ruby.rc

# Using prebuilt audio libs right now
PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/system/lib/hw/audio.primary.msm8660.so:system/lib/hw/audio.primary.msm8660.so \
    device/htc/ruby/prebuilt/system/lib/hw/audio_policy.msm8660.so:system/lib/hw/audio_policy.msm8660.so

#    device/htc/ruby/prebuilt/system/lib/hw/audio.a2dp.default.so:system/lib/hw/audio.a2dp.default.so

PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/system/lib/hw/gps.ruby.so:/system/lib/hw/gps.ruby.so \
    device/htc/ruby/prebuilt/system/lib/libloc_api-rpc-qc.so:/system/lib/libloc_api-rpc-qc.so \
    device/htc/ruby/prebuilt/system/lib/libcommondefs.so:system/lib/libcommondefs.so \
    device/htc/ruby/prebuilt/system/lib/hw/sensors.ruby.so:/system/lib/hw/sensors.ruby.so

## Using prebuilt libril.so right now
#PRODUCT_COPY_FILES += \
#    device/htc/ruby/prebuilt/ril/libril.so:system/lib/libril.so \
#    device/htc/ruby/prebuilt/ril/libreference-ril.so:/system/lib/libreference-ril.so \
#    device/htc/ruby/prebuilt/ril/rild:/system/bin/rild

# Add touchscreen config file
PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/system/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/ruby/prebuilt/system/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/ruby/prebuilt/system/usr/idc/ruby-keypad.idc:system/usr/idc/ruby-keypad.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/system/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/ruby/prebuilt/system/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/ruby/prebuilt/system/usr/keychars/ruby-keypad.kcm.bin:system/usr/keychars/ruby-keypad.kcm.bin \
    device/htc/ruby/prebuilt/system/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/ruby/prebuilt/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/ruby/prebuilt/system/usr/keylayout/ruby-keypad.kl:system/usr/keylayout/ruby-keypad.kl \
    device/htc/ruby/prebuilt/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl

# This is in vendor for now
## Wifi Module
#PRODUCT_COPY_FILES += \
#    device/htc/ruby/prebuilt/system/lib/modules/kineto_gan.ko:system/lib/modules/kineto_gan.ko \
#    device/htc/ruby/prebuilt/system/lib/modules/tiwlan_drv.ko:system/lib/modules/tiwlan_drv.ko \
#    device/htc/ruby/prebuilt/system/lib/modules/tiap_drv.ko:system/lib/modules/tiap_drv.ko

PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab \
    device/htc/ruby/prebuilt/system/etc/init.post_boot.sh:system/etc/init.post_boot.sh

PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/system/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/htc/ruby/prebuilt/system/etc/spn-conf.xml:system/etc/spn-conf.xml \
    device/htc/ruby/prebuilt/system/etc/voicemail-conf.xml:system/etc/voicemail-conf.xml

# Prebuilt kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/htc/ruby/prebuilt/root/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# recovery charge mode support
include device/htc/ruby/recovery/recovery.mk

# media profiles and capabilities spec
$(call inherit-product, device/htc/ruby/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/ruby/media_htcaudio.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/ruby/ruby-vendor.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_NAME := full_ruby
PRODUCT_DEVICE := ruby
PRODUCT_MODEL := Amaze 4g
PRODUCT_MANUFACTURER := HTC
