# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from Daredevil device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := nokia
PRODUCT_DEVICE := Daredevil
PRODUCT_MANUFACTURER := nokia
PRODUCT_NAME := lineage_Daredevil
PRODUCT_MODEL := Nokia 7.2

PRODUCT_GMS_CLIENTID_BASE := android-nokia
TARGET_VENDOR := nokia
TARGET_VENDOR_PRODUCT_NAME := Daredevil
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="m690-user 9 PKQ1.190118.001 90 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := Nokia/Daredevil_00WW/DDV_sprout:9/PKQ1.190118.001/00WW_1_390:user/release-keys
