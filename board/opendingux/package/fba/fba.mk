################################################################################
#
# FB Alpha
#
################################################################################

FBA_VERSION = e4f7c3b9d3
FBA_SITE = $(call github,nobk,fba-sdl,$(FBA_VERSION))
FBA_DEPENDENCIES = sdl sdl_image zlib

define FBA_BUILD_CMDS
	$(TARGET_MAKE_ENV) MAKELEVEL=0 $(MAKE1) -C $(@D) -f Makefile.dingux
endef

define FBA_INSTALL_TARGET_CMDS
	cd $(@D)/bin && mksquashfs skin fbasdl.dge skin/fba_icon.png default.gcw0.desktop fba_explorer.gcw0.desktop fba-rg350.opk -all-root -no-xattrs -noappend -no-exports
	$(INSTALL) -D $(@D)/bin/fba-rg350.opk $(BINARIES_DIR)/opks/
endef

$(eval $(generic-package))
