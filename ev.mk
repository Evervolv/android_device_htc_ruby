#
# Copyright (C) 2013 The Evervolv Project
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

# Call this first so apn list is actually copied
$(call inherit-product, $(SRC_EVERVOLV_DIR)/config/apns.mk)

# Product makefile
$(call inherit-product, device/htc/ruby/device.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, $(SRC_EVERVOLV_DIR)/config/common_full_phone.mk)

# Pull all dictionaries
$(call inherit-product, $(SRC_EVERVOLV_DIR)/config/dictionaries/intl.mk)

# Bootanimation
BOOT_ANIMATION_SIZE := qhd

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

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your HTC Amaze 4G\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @preludedrew for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"


