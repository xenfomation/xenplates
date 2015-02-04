
##[ Peppermint 5  ]#############################################################
#
# REV 2.0
# 28 DEC 2014, JK Benedict
# xenfomation.servercide.com | @xenfomation
# 
# XENSERVER AND TEMPLATE INFORMATION:
#
# INTENDED FOR	: XenServer 6.5
# TESTED ON		: XenServer 6.2, 6.5
# DISTRO		: Based on Debian, Lubuntu
# ARCHITECTURE	: 32/64 BITS
# XENTOOLS		: Must be manually installed (dpkg -i xe*amd64.deb or dpkg -i xe*i386.deb)
# OTHER NOTES	: MUST run updates to install - this prevents visual issues
#
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)

dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Peppermint 5")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE for Peppermint 5 (32 or 64-bit).  MINIMUM Guest VM requirements are 1GB of RAM and 5GB of available disk space.  The installer media can be downloaded from http://peppermintos.com/" \
	memory-static-max=1073741824 \
	memory-dynamic-max=1073741824 \
	memory-dynamic-min=1073741824 \
	other-config:linux_template=true \
	other-config:install-distro=debianlike \
	other-config:install-arch=amd64 \
	other-config:default_template=true \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="5368709120" sr="" bootable="true" type="system"/></provision>' \
	platform:nx=true \
	platform:vga=std \
	platform:videoram=16 \
	platform:device_id=0001 \
	platform:acpi=1 \
	platform:apic=true \
	platform:pae=true \
	platform:viridian=false \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn" 

xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name

xe template-list uuid=$dstUUID