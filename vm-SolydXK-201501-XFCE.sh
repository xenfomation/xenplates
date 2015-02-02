
##[ SolydXK Linux 201501 ]######################################################
#
# REV 1.0
# 1 FEB 2015, JK Benedict
# xenfomation.servercide.com | @xenfomation
# 
# XENSERVER AND TEMPLATE INFORMATION:
#
# OPINION		: WORKS WELL
#
# INTENDED FOR	: XenServer 6.5
# TESTED ON		: XenServer 6.5 
# DISTRO		: Debian (Unstable)
# ARCHITECTURE	: 32/64 BITS
# XENTOOLS		: Must be manually installed (dpkg -i xe*amd64.deb or dpkg -i xe*i386.deb)
# OTHER NOTES	: Post-install of the Guest VM, ensure to update the OS
#				  Mount XenTools ISO and manually install Guest Utilities
#				  Recommend installing XRDP for secure, mult-user access
#
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)

dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="SolydXK Linux 201501 (XFCE Spin)")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE for SolydXK Linux 201501 (XFCE Spin): 32 or 64-bit.  Guest VM requirements may be currently over estimated.  The installer media can be downloaded from http://solydxk.com/" \
	memory-static-max=536870912 \
	memory-dynamic-max=536870912 \
	memory-dynamic-min=536870912 \
	other-config:linux_template=true \
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