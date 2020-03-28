################################################################################
#
# DinguxCommander
#
################################################################################

DINGUX_COMMANDER_VERSION = d779431fbfda9c32d86b3dd28da71da4195f81c3
DINGUX_COMMANDER_SITE = $(call github,glebm,rs97-commander,$(DINGUX_COMMANDER_VERSION))
DINGUX_COMMANDER_DEPENDENCIES = sdl sdl_image freetype

DINGUX_COMMANDER_TARGET_PLATFORM = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_VENDOR))
DINGUX_COMMANDER_CONF_OPTS += -DTARGET_PLATFORM=$(DINGUX_COMMANDER_TARGET_PLATFORM)

define DINGUX_COMMANDER_INSTALL_TARGET_CMDS
	mkdir -p $(BINARIES_DIR)/opks
	cd $(@D) && ./package-opk.sh $(DINGUX_COMMANDER_TARGET_PLATFORM) $(DINGUX_COMMANDER_BUILDDIR) \
	  $(BINARIES_DIR)/opks/commander.opk
endef

$(eval $(cmake-package))
