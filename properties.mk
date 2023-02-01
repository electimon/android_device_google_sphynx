# AV
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.avsync=true

ifneq ($(TARGET_TEGRA_KERNEL),3.10)
# Bpf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.ebpf.supported=1
endif

# Charger
PRODUCT_SYSTEM_PROPERTY_OVERRIDES += \
    persist.sys.NV_ECO.IF.CHARGING=false

# Power brick info
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.power.brick=PB1000

# USB configfs
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.sys.usb.udc=700d0000.xudc \
    sys.usb.controller=700d0000.xudc

# USB convertible port
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.convertible.usb.mode=host

# USB VID/PID
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.nv.usb.pid.rndis.acm.adb=AF00 \
    ro.vendor.nv.usb.pid.ncm=7107 \
    ro.vendor.nv.usb.pid.ncm.adb=7108 \
    ro.vendor.nv.usb.pid.midi.adb=710A \
    ro.vendor.nv.usb.pid.ecm=710B \
    ro.vendor.nv.usb.pid.ecm.adb=710C \
    ro.vendor.nv.usb.vid=18D1 \
    ro.vendor.nv.usb.pid.mtp=5202 \
    ro.vendor.nv.usb.pid.mtp.adb=5203 \
    ro.vendor.nv.usb.pid.ptp=5206 \
    ro.vendor.nv.usb.pid.ptp.adb=5207 \
    ro.vendor.nv.usb.pid.rndis=5204 \
    ro.vendor.nv.usb.pid.rndis.adb=5205 \
    ro.vendor.nv.usb.pid.adb=5208 \
    ro.vendor.nv.usb.pid.accessory.adb=2D01 \
    ro.vendor.nv.usb.pid.audio_source.adb=2D03 \
    ro.vendor.nv.usb.pid.midi=5209
