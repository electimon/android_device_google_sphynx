#!/vendor/bin/sh
hardwareName=$(getprop ro.hardware)
/vendor/bin/modprobe -a -d /vendor/lib/modules bcmdhd;
