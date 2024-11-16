#!/system/bin/sh
#
# set some props, depending on device
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2024 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

setdevicespecs() {
    resetprop "ro.product.device" "$1";
    resetprop "ro.product.vendor.device" "$1";
    resetprop "ro.product.odm.device" "$1";
    resetprop "ro.build.product" "$1";
    resetprop "ro.product.system.device" "$1";
    resetprop "ro.product.system_ext.device" "$1";
}

setdevicemodel() {
    resetprop "ro.product.model" "$1"
    resetprop "ro.product.odm.model" "$1"
    resetprop "ro.product.system.model" "$1"
    resetprop "ro.product.vendor.model" "$1"
    resetprop "ro.product.system_ext.model" "$1"
    resetprop "ro.product.product.model" "$1"
 }

do_props() {
    resetprop "ro.product.marketname" "$device_description";
    resetprop "ro.product.odm.marketname" "$device_description";
    resetprop "ro.product.vendor.marketname" "$device_description";
    resetprop "bluetooth.device.default_name" "$device_description";
    resetprop "vendor.usb.product_string" "$device_description";

    resetprop "ro.product.brand" "$brand";
    resetprop "ro.product.odm.brand" "$brand";
    resetprop "ro.product.system.brand" "$brand";
    resetprop "ro.product.system_ext.brand" "$brand";
    resetprop "ro.product.product.brand" "$brand";
    resetprop "ro.product.vendor.brand" "$brand";
}

do_earth() {
        if [ "$brand" = "Xiaomi" ]; then
	    setdevicemodel "Redmi 12c";
            device_description="Redmi 12c";
        elif [ "$brand" = "POCO" ]; then      
	    setdevicemodel "POCO C55";
            device_description="POCO C55";
        fi
}

do_earther() {
        if [ "$brand" = "Xiaomi" ]; then
	    setdevicemodel "Redmi 12c";
            device_description="Redmi 12c";
        elif [ "$brand" = "POCO" ]; then 
	    setdevicemodel "POCO C55";
            device_description="POCO C55";
        fi
}


process_devices() {
	variant=$(resetprop "ro.boot.hwname");

	if [ "$variant" = "earth" ]; then
		do_earth;
	elif [ "$variant" = "earther" ]; then
		do_earther;
	fi
    	
    	do_props;
    	setdevicespecs "$variant";
      
}

# ----
	process_devices;
	exit 0;
#
