# Inherit AOSP device configuration for inc.
$(call inherit-product, device/htc/ruby/full_ruby.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := ev_ruby
PRODUCT_BRAND := HTC
PRODUCT_DEVICE := ruby
PRODUCT_MODEL := HTC Amaze 4g
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_ruby BUILD_ID=GRJ22 BUILD_FINGERPRINT=tmous/htc_ruby/ruby:2.3.4/GRJ22/192596.3:user/release-keys PRIVATE_BUILD_DESC="1.43.531.3 CL83920 release-keys"

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := Iaceo
PRODUCT_VERSION_DEVICE_SPECIFIC := p1

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your HTC Amaze 4g\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @preludedrew for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"

#PRODUCT_PACKAGES += \
    Camera

# Copy compatible prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/ev/prebuilt/qhd/media/bootanimation.zip:system/media/bootanimation.zip

# qHD overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/ev/overlay/qhd

# USB
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage

#ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mtp,adb
