
##[ NethServer 6.5 ]############################################################
#
# REV 2.0
# 30 NOV 2014, JK Benedict
# xenfomation.servercide.com | @xenfomation
# 
# XENSERVER AND TEMPLATE INFORMATION:
#
# OPINION		: WORKS WELL
#
# INTENDED FOR	: XenServer 6.5
# TESTED ON		: XenServer 6.5
# DISTRO		: CentOS 6.5
# ARCHITECTURE	: 64 BITS
# XENTOOLS		: Must be manually installed (rpm -ivh xe*x86_64.rpm)
# OTHER NOTES	: Post-install, there is no UI and only command-line.  This
#				  is because this DISTRO and its SOLUTIONS are controlled
#				  via WEB INTERFACE.
#
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)

dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="NethServer 6.5")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE for NethServer 6.5: a \"64-bit only\" Linux distro. MINIMUM Guest VM requirements are 1GB of RAM and at least 8GB of available disk space. OPTIMUM Guest VM requirements depend on the scope/planned use of NethServer 6.5. The installer media can be downloaded from http://www.nethserver.org/" \
	memory-static-max=1073741824 \
	memory-dynamic-max=1073741824 \
	memory-dynamic-min=1073741824 \
	other-config:linux_template=true \
	other-config:rhel6=true \
	other-config:install-distro=rhlike \
	other-config:install-arch=amd64 \
	other-config:default_template=true \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="8589934592" sr="" bootable="true" type="system"/></provision>' \
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
