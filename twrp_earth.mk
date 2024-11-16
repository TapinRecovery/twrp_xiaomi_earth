# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from earth device
$(call inherit-product, device/xiaomi/earth/device.mk)

# Product Specifics
PRODUCT_NAME := twrp_earth
PRODUCT_DEVICE := earth
PRODUCT_BRAND := xiaomi
PRODUCT_MODEL := Redmi 12C
PRODUCT_MANUFACTURER := Xiaomi
