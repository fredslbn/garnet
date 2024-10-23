# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=SUPER.KERNEL GARNET
do.devicecheck=0
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=garnet
device.name2=
device.name3=
device.name3=
supported.versions=13 - 15
'; } # end properties

# shell variables
block=boot
is_slot_device=1
ramdisk_compression=auto
patch_vbmeta_flag=auto


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel install
split_boot # Use split_boot to skip ramdisk unpack, e.g., for devices with init_boot ramdisk

ui_print "- $(strings "${home}"/Image 2>/dev/null | grep -E -m1 'Linux version.*#' | awk '{print $3}')"

flash_boot # Use flash_boot to skip ramdisk repack, e.g., for devices with init_boot ramdisk

## end install

sleep 3
ui_print ""
ui_print "kernel installed successfully"
