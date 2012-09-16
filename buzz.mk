# Copyright (C) 2011 The Android Open Source Project
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

# kernel (TODO: compile at build)
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Dalvik tweak
DISABLE_DEXPREOPT := false
PRODUCT_TAGS += dalvik.gc.type-precise

# Include device specific overlays
	DEVICE_PACKAGE_OVERLAYS := device/ldpi-common/overlay

# DPI size for Buzz
	PRODUCT_LOCALES += mdpi
	
# Input device calibration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/touchscreen/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    $(LOCAL_PATH)/prebuilt/touchscreen/curcial-oj.idc:system/usr/idc/curcial-oj.idc \
    $(LOCAL_PATH)/prebuilt/touchscreen/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# Keychars and keylayout files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/keyfiles/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    $(LOCAL_PATH)/prebuilt/keyfiles/atmel-touchscreen.kcm:system/usr/keychars/atmel-touchscreen.kcm \
    $(LOCAL_PATH)/prebuilt/keyfiles/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    $(LOCAL_PATH)/prebuilt/keyfiles/synaptics-rmi-touchscreen.kcm:system/usr/keychars/synaptics-rmi-touchscreen.kcm \
    $(LOCAL_PATH)/prebuilt/keyfiles/buzz-keypad.kl:system/usr/keylayout/buzz-keypad.kl \
    $(LOCAL_PATH)/prebuilt/keyfiles/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

# Bluetooth cfg file & BCM4329 firmware and module
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/wifi/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    $(LOCAL_PATH)/prebuilt/wifi/bcm4329.ko:root/lib/modules/bcm4329.ko \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# Media profile XML
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/media_profiles.xml:/system/etc/media_profiles.xml

# Module compiled for Buzz
PRODUCT_PACKAGES += \
    lights.buzz \
    sensors.buzz \
    gralloc.buzz \
    copybit.buzz \
    gps.buzz \
    camera.buzz \
    audio.primary.buzz \
    audio_policy.buzz \
    audio.a2dp.default

# Misc
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Omx
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

PRODUCT_PACKAGES += \
    Torch \
    Gallery \
    FM

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/initramfs/init.buzz.rc:root/init.buzz.rc \
    $(LOCAL_PATH)/initramfs/init.buzz.usb.rc:root/init.buzz.usb.rc \
    $(LOCAL_PATH)/initramfs/ueventd.buzz.rc:root/ueventd.buzz.rc \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

# TWEAKS: init.d scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.d/77tweaks:system/etc/init.d/77tweaks
	
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product-if-exists, vendor/htc/buzz/buzz-vendor.mk)
$(call inherit-product-if-exists, vendor/htc/buzz/buzz-vendor-blobs.mk)

# OTA Update Center
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/apk/OTAUpdater.apk:system/app/OTAUpdater.apk

# WinSuk's trackball wake script
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/bin/trackballwake:system/bin/trackballwake
