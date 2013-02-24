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

## Manually copy the proprietary files, as my vendor folder thasn't get read?

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/libgps.so:obj/lib/libgps.so \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/libcamera.so:obj/lib/libcamera.so

# Proprietary stuff
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/AudioPara4.csv:system/etc/AudioPara4.csv \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/AudioPara_HTC_NEL.csv:system/etc/AudioPara_HTC_NEL.csv \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/AudioPreProcess.csv:system/etc/AudioPreProcess.csv \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/libaudioeq.so:system/lib/libaudioeq.so \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/libgps.so:system/lib/libgps.so \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/liboemcamera.so:system/lib/liboemcamera.so \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/libcamera.so:system/lib/libcamera.so \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/libhtc_acoustic.so:system/lib/libhtc_acoustic.so \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/libhtc_ril.so:system/lib/libhtc_ril.so \
    $(LOCAL_PATH)/../../../vendor/htc/buzz/proprietary/akmd:system/bin/akmd

## end of the vendor files

# Dalvik tweak
DISABLE_DEXPREOPT := false
PRODUCT_TAGS += dalvik.gc.type-precise

# Add device specific overlays
	DEVICE_PACKAGE_OVERLAYS += device/ldpi-common/overlay

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
PRODUCT_PACKAGES += \
    fw_bcm4329.bin \
    fw_bcm4329_apsta.bin

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    $(LOCAL_PATH)/prebuilt/firmware/fw_bcm4329.bin:/system/etc/firmware/fw_bcm4329.bin \
    $(LOCAL_PATH)/prebuilt/firmware/bcm4329.hcd:system/vendor/firmware/bcm4329.hcd \
    $(LOCAL_PATH)/prebuilt/firmware/bcm4329.ko:system/lib/modules/bcm4329.ko \
    $(LOCAL_PATH)/prebuilt/firmware/fw_bcm4329.bin:vendor/firmware/fw_bcm4329.bin \
    $(LOCAL_PATH)/prebuilt/firmware/fw_bcm4329_apsta.bin:/vendor/firmware/fw_bcm4329_apsta.bin \
    $(LOCAL_PATH)/prebuilt/wpa_supplicant_template.conf:data/misc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Media profile XML
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/media_codecs.xml:/system/etc/media_codecs.xml \
    $(LOCAL_PATH)/prebuilt/media_profiles.xml:/system/etc/media_profiles.xml

# Audio_policy.conf
PRODUCT_COPY_FILES += \
    device/htc/buzz/prebuilt/audio_policy.conf:system/etc/audio_policy.conf

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

# Gsm
PRODUCT_PACKAGES += \
    rild

# Misc
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Omx
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
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
	
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Interfaces
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2,gprs,ppp0 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

#Attempting to get wifi to work
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcm4329/Android.mk)
