#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include <android-base/file.h>
#include <android-base/properties.h>
#include <android-base/logging.h>
#include <android-base/strings.h>

#include <cstdlib>
#include <stdlib.h>
#include <stdio.h>
#include <fstream>
#include <iostream>
#include <string>
#include <sstream>
#include <sys/sysinfo.h>

#include "vendor_init.h"
#include "property_service.h"

using android::base::GetProperty;
using android::init::property_set;
//using namespace std;

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void property_override_3x(char const product_prop[], char const system_prop[], char const vendor_prop[], char const value[])
{
    property_override(product_prop, value);
    property_override(system_prop, value);
    property_override(vendor_prop, value);
}

void property_override_4x(char const product_prop[], char const system_prop[], char const vendor_prop[], char const bootimage[], char const value[])
{
    property_override(product_prop, value);
    property_override(system_prop, value);
    property_override(vendor_prop, value);
    property_override(bootimage, value);
}

static void set_model(const char *model) {
    property_override("ro.hw.oemName", model);
    property_override("ro.build.product", model);
    property_override_3x("ro.product.model", "ro.product.system.model", "ro.product.vendor.model", model);
}

void vendor_load_properties()
{
    int i;
    std::ifstream fin;
    std::string buf;

    fin.open("/sys/firmware/devicetree/base/hisi,boardname");
    while (std::getline(fin, buf, ' '))
        if ((buf.find("BTV_DL09") != std::string::npos) || (buf.find("BTV_L0J") != std::string::npos) || (buf.find("BTV_W09") != std::string::npos))
            break;
    fin.close();

    if (buf.find("BTV_DL09") != std::string::npos) {
	set_model("BTV-DL09");
	property_override("net.tethering.noprovisioning", "true");
	property_override("ro.build.description", "BTV-DL09-user 7.0 HUAWEIBEETHOVEN-DL09 C100B311 release-keys");
	property_override_4x("ro.system.build.fingerprint", "ro.vendor.build.fingerprint", "ro.odm.build.fingerprint", "ro.bootimage.build.fingerprint", "HUAWEI/BEETHOVEN/hwbeethoven:7.0/HUAWEIBEETHOVEN-DL09/C100B311:user/release-keys");
    }
    else if (buf.find("BTV_L0J") != std::string::npos) {
	set_model("BTV-L0J");
	property_override("net.tethering.noprovisioning", "true");
	property_override("ro.build.description", "BTV-L0J-user 6.0 HUAWEIBTV-L0J C137B035 release-keys");
	property_override_4x("ro.system.build.fingerprint", "ro.vendor.build.fingerprint", "ro.odm.build.fingerprint", "ro.bootimage.build.fingerprint", "dtab/BEETHOVEN/d-01J:6.0/HUAWEIBTV-L0J/17053102:user/release-keys");
    }
    else if (buf.find("BTV_W09") != std::string::npos) {
	set_model("BTV-W09");
	property_override("persist.radio.noril", "1");
	property_override("ro.carrier", "wifi-only");
	property_override("ro.build.description", "BTV-W09-user 7.0 HUAWEIBEETHOVEN-W09 C100B308 release-keys");
	property_override_4x("ro.system.build.fingerprint", "ro.vendor.build.fingerprint", "ro.odm.build.fingerprint", "ro.bootimage.build.fingerprint", "HUAWEI/BEETHOVEN/hwbeethoven:7.0/HUAWEIBEETHOVEN-W09/C100B308:user/release-keys");
    }
    else {
	property_override("ro.product.model", "UNKNOWN");
    }
    
    fin.open("/proc/connectivity/chiptype");
    while (std::getline(fin, buf, ' '))
    	if (buf.find("hisi") != std::string::npos)
            break;
    fin.close();

    if (buf.find("hisi") != std::string::npos) {
        	property_override("ro.connectivity.chiptype", "hisi");
        	property_override("is_hisi_connectivity_chip", "1");
    		property_override("ro.boot.odm.conn.chiptype", "hisi");
    	}
    
    fin.open("/sys/firmware/devicetree/base/hi1102/name");
    while (std::getline(fin, buf, ' '))
        if (buf.find("hi1102") != std::string::npos)
            break;
    fin.close();
    
    if (buf.find("hi1102") != std::string::npos) {
        	property_override("ro.connectivity.sub_chiptype", "hi1102");
        	property_override("ro.boot.odm.conn.schiptype", "hi1102");
        }
}
