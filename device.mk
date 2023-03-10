#
# Copyright (C) 2023 The LineageOS Project
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

# Tegra Selectors
TARGET_TEGRA_VARIANT := common
TARGET_TEGRA_VERSION := t210
TARGET_TEGRA_FIRMWARE_BRANCH := rel-shield-r
TARGET_TEGRA_WIFI := bcm

include device/nvidia/t210-common/t210.mk

# Properties
include $(LOCAL_PATH)/properties.mk

PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG  := xhdpi

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    device/google/sphynx/overlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += device/google/sphynx

# Init related
PRODUCT_PACKAGES += \
    fstab.sphynx \
    init.dragon.rc \
    init.recovery.dragon.rc \
    power.sphynx.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \

# Audio
PRODUCT_PACKAGES += \
    audio_effects.xml \
    audio_policy_configuration.xml \
    nvaudio_conf.xml \
    nvaudio_fx.xml

# Kernel
ifneq ($(TARGET_PREBUILT_KERNEL),)
TARGET_FORCE_PREBUILT_KERNEL := true
else
PRODUCT_PACKAGES += \
    cypress-fmac
endif

# Keylayouts
PRODUCT_PACKAGES += \
    gpio-keys.kl

# Light
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service-nvidia

# Loadable kernel modules
PRODUCT_PACKAGES += \
    init.lkm.rc \
    lkm_loader \
    lkm_loader_target

# Media config
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_ODM)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_ODM)/etc/media_codecs_google_video.xml

PRODUCT_PACKAGES += \
    media_codecs.xml \
    media_codecs_performance.xml \
    media_profiles_V1_0.xml \
    enctune.conf

# PHS
PRODUCT_PACKAGES += \
    nvphsd.conf

# Power
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Treble workaround
PRODUCT_PACKAGES += $(PRODUCT_PACKAGES_SHIPPING_API_LEVEL_29)

# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# WiFi
PRODUCT_PACKAGES += \
    wifi_scan_config.conf

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4-service.clearkey \
    android.hardware.drm@1.3.vendor \
    android.hardware.drm@1.4.vendor

# Vendor
$(call inherit-product, device/nvidia/t210-common/vendor/t210-by-flags.mk)
$(call inherit-product, device/nvidia/tegra-common/vendor/common-by-flags.mk)

# VBoot
$(call inherit-product, build/target/product/vboot.mk)

