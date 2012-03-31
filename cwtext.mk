$(call PKG_INIT_BIN, 0.96)
$(PKG)_SOURCE:=cwtext-$($(PKG)_VERSION).tar.gz
$(PKG)_SOURCE_MD5:=d5083cd92d255fba6ff425fbd68aa405
$(PKG)_SITE:=@SF/cwtext
$(PKG)_BINARY:=$($(PKG)_DIR)/cwtext
$(PKG)_TARGET_BINARY:=$($(PKG)_DEST_DIR)/usr/bin/cwtext

$(PKG_SOURCE_DOWNLOAD)
$(PKG_UNPACKED)
$(PKG_CONFIGURED_NOP)

$($(PKG)_BINARY): $($(PKG)_DIR)/.configured
	$(SUBMAKE) -C $(CWTEXT_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)"

$($(PKG)_TARGET_BINARY): $($(PKG)_BINARY)
	$(INSTALL_BINARY_STRIP)

$(pkg):

$(pkg)-precompiled: $($(PKG)_TARGET_BINARY)

$(pkg)-clean:
	-$(SUBMAKE) -C $(EMPTY_DIR) clean
	$(RM) $(EMPTY_DIR)/.configured

$(pkg)-uninstall:
	$(RM) $(EMPTY_TARGET_BINARY)

$(PKG_FINISH)
