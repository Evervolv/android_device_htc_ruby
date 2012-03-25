#
# This is the device-specific product configuration for ruby,
# configured with US-specific settings.
#

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# The rest of the configuration is inherited from a generic config
$(call inherit-product, device/htc/ruby/ruby.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_NAME := full_ruby
PRODUCT_DEVICE := ruby
PRODUCT_MODEL := Full Android on Ruby
