
##[ Linux Mint 17.1 Rebecca KDE ]###############################################
#
# REV 2.0
# 01 FEB 2015, JK Benedict
# xenfomation.servercide.com | @xenfomation
# 
# XENSERVER AND TEMPLATE INFORMATION:
#
# OPINION		: DO NOT USE UNLESS FOR EXPIREMENTATION
#
# INTENDED FOR	: XenServer 6.5
# TESTED ON		: XenServer 6.2, 6.5
# DISTRO		: Based on Ubuntu (which implies Debian)
# ARCHITECTURE	: 32/64 BITS
# XENTOOLS		: Must be manually installed (dpkg -i xe-guest*deb)
# OTHER NOTES	: Plasma menu controls/are UNUSABLE if not UNREADABLE
#
################################################################################

#
# TEMPLATE TO BE UPDATED WHEN TESTING PROVES THAT KDE VISUALS ARE PERFECT
#

#srcUUID=$(xe template-list name-label="Other install media" --minimal)
#
#dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Linux Mint 17.1 Rebecca (KDE Spin)")
#
#xe template-param-set uuid=$dstUUID \
#	name-description="COMMUNITY TEMPLATE for Linux Mint 17.1 \"Rebecca\": KDE LTS Edition (32 or 64-bit). MINIMUM Guest VM requirements are 512MB of RAM and 10GB of available disk space. OPTIMUM Guest VM requirements are 1024MB of RAM and 20GB of available disk space. The installer media can be downloaded from http://www.linuxmint.com/download.php" \
#	memory-static-max=536870912 \
#	memory-dynamic-max=536870912 \
#	memory-dynamic-min=536870912 \
#	other-config:linux_template=true \
#	other-config:debian-release=trusty \
#	other-config:install-distro=debianlike \
#	other-config:install-arch=amd64 \
#	other-config:default_template=true \
#	other-config:install-methods=cdrom,http,ftp,nfs \
#	other-config:disks='<provision><disk device="0" size="10737418240" sr="" bootable="true" type="system"/></provision>' \
#	platform:nx=true \
#	platform:vga=std \
#	platform:videoram=16 \
#	platform:device_id=0001 \
#	platform:acpi=1 \
#	platform:apic=true \
#	platform:pae=true \
#	platform:viridian=false \
#	HVM-boot-policy="BIOS order" \
#	HVM-boot-params:order="cdn" 
#
#xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
#
#xe template-list uuid=$dstUUID