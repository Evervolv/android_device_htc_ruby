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

PRODUCT_AAPT_CONFIG         := normal hdpi
PRODUCT_AAPT_PREF_CONFIG    := hdpi
PRODUCT_LOCALES             += en
PRODUCT_TAGS                += dalvik.gc.type-precise

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril.v3=signalstrength,singlepdp \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.sf.lcd_density=240

# Dalvik
include frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk

PRODUCT_PROPERTY_OVERRIDES += \
    debug.fb.rgb565=0 \
    debug.sf.hw=1 \
    debug.composition.type=dyn \
    hwui.disable_vsync=false \
    hwui.print_config=choice \
#    ro.sf.compbypass.enable=1
#    debug.enabletr=true

PRODUCT_PROPERTY_OVERRIDES += \
    debug.qctwa.preservebuf=1 \
    com.qc.hardware=true
#    com.qc.hdmi_out=false

# USB
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage \
    persist.service.adb.enable=1

#
# Packages required for ruby
#
PRODUCT_PACKAGES += \
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

# Ramdisk (ks/qcks copied from vendor)
PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/root/init.qcom.sh:root/init.qcom.sh \
    device/htc/ruby/prebuilt/root/init.ruby.rc:root/init.ruby.rc \
    device/htc/ruby/prebuilt/root/init.ruby.usb.rc:root/init.ruby.usb.rc \
    device/htc/ruby/prebuilt/root/ueventd.ruby.rc:root/ueventd.ruby.rc

# Boot scripts
PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/etc/init.goldfish.sh:system/etc/init.goldfish.sh \
    device/htc/ruby/prebuilt/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/htc/ruby/prebuilt/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    device/htc/ruby/prebuilt/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/htc/ruby/prebuilt/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
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
    device/htc/ruby/prebuilt/usr/keylayout/ruby-keypad.kl:system/usr/keylayout/ruby-keypad.kl \
    device/htc/ruby/prebuilt/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    device/htc/ruby/prebuilt/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/htc/ruby/prebuilt/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    device/htc/ruby/prebuilt/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    device/htc/ruby/prebuilt/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    device/htc/ruby/prebuilt/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
    device/htc/ruby/prebuilt/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    device/htc/ruby/prebuilt/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl

# Default permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/location/lib/com.android.location.provider.xml:system/etc/permissions/com.android.location.provider.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# Other permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

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
