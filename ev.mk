# Inherit AOSP device configuration for ruby.
$(call inherit-product, device/htc/ruby/device.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/gsm.mk)
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

# Call gps Xtra server configuration
$(call inherit-product, device/common/gps/gps_us.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME    := ev_ruby
PRODUCT_BRAND   := htc
PRODUCT_DEVICE  := ruby
PRODUCT_MODEL   := HTC Amaze 4G
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_ruby BUILD_FINGERPRINT=tmous/htc_ruby/ruby:4.4/KRT16M/373265.3:user/release-keys PRIVATE_BUILD_DESC="2.14.531.3 CL373265 release-keys" BUILD_NUMBER=373265

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := Iaceo

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your HTC Amaze 4g\n------------------------------------------------\n"

# Copy compatible bootanimation
PRODUCT_COPY_FILES +=  \
    vendor/ev/prebuilt/qhd/media/bootanimation.zip:system/media/bootanimation.zip

# Hot reboot
PRODUCT_PACKAGE_OVERLAYS += vendor/ev/overlay/hot_reboot
