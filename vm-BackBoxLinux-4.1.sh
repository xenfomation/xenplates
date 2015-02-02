
##[ BackBox Linux 4.1 ]#########################################################
#
# 1 FEB 2015, JK Benedict
# xenfomation.servercide.com | @xenfomation
#
# TESTED ON		: XenServer 6.5
# ARCHITECTURE	: 32/64 BITS
# XENTOOLS		: Tools install without manual intervention
# OTHER NOTES	: Post installation and OS updates, XRDP should be installed as
#				  it serves well for individual RDP-based access to the Guest
#				  VM and also leaves ROOT management.
#
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)

dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="BackBox Linux 4.1")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE for BackBox Linux 4.1 (32 or 64-bit). OPTIMUM Guest VM requirements are 1024MB of RAM and 10GB of available disk space. The installer media can be downloaded from http://www.backbox.org/" \
	memory-static-max=1073741824 \
	memory-dynamic-max=1073741824 \
	memory-dynamic-min=1073741824 \
	other-config:linux_template=true \
	other-config:debian-release=wheezy \
	other-config:install-distro=debianlike \
	other-config:install-arch=amd64 \
	other-config:default_template=true \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="10737418240" sr="" bootable="true" type="system"/></provision>' \
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
