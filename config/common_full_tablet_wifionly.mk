# Inherit common CM stuff
$(call inherit-product, vendor/cm/config/common_full.mk)

# Required CM packages
PRODUCT_PACKAGES += \
    LatinIME

# Drop misc packages
PRODUCT_PACKAGES += \
    NoEmail \
    NoContacts

# Include CM LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/cm/overlay/dictionaries
