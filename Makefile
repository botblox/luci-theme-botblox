#
# Copyright (C) 2025 Aaron Elijah <aaron@botblox.org>
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=BotBlox OpenWrt theme
LUCI_DEPENDS:=+luci-base

define Package/luci-theme-botblox/postrm
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
	uci -q delete luci.themes.BotBlox
	uci commit luci
}
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
