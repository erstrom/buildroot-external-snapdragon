################################################################################
#
# ath10k-firmware
#
################################################################################

ATH10K_FIRMWARE_SITE_METHOD = git
ATH10K_FIRMWARE_VERSION = $(BR2_PACKAGE_ATH10K_FIRMWARE_GIT_REV)
ATH10K_FIRMWARE_SITE = $(BR2_PACKAGE_ATH10K_FIRMWARE_GIT_URL)

ifeq ($(BR2_PACKAGE_ATH10K_FIRMWARE_USB_WUSB6100M), y)
define ATH10K_FIRMWARE_CREATE_SYMLINKS
	( \
		ln -sf eeprom_qca9377_7_1p1_Robin_clpc_ce.bin $(TARGET_DIR)/lib/firmware/ath10k/QCA9377/hw1.0/board-usb.bin; \
		ln -sf firmware-usb-5-wusb6100m.bin $(TARGET_DIR)/lib/firmware/ath10k/QCA9377/hw1.0/firmware-usb-5.bin; \
	)
endef
endif

ifeq ($(BR2_PACKAGE_ATH10K_FIRMWARE_USB_SPARKLAN), y)
define ATH10K_FIRMWARE_CREATE_SYMLINKS
	( \
		ln -sf fakeBoardData_AR6320_sparklan.bin $(TARGET_DIR)/lib/firmware/ath10k/QCA9377/hw1.0/board-usb.bin; \
		ln -sf firmware-usb-5-sparklan.bin $(TARGET_DIR)/lib/firmware/ath10k/QCA9377/hw1.0/firmware-usb-5.bin; \
	)
endef
endif

ifeq ($(BR2_PACKAGE_ATH10K_FIRMWARE_SDIO_SILEX_SDMAC), y)
define ATH10K_FIRMWARE_CREATE_SYMLINKS
	( \
		ln -sf board-sdio-silex-SDMAC-20161026.bin $(TARGET_DIR)/lib/firmware/ath10k/QCA9377/hw1.0/board-sdio.bin; \
		ln -sf untested/firmware-sdio-5.bin_WLAN.TF.1.1.1-00061-QCATFSWPZ-1 $(TARGET_DIR)/lib/firmware/ath10k/QCA9377/hw1.0/firmware-sdio-5.bin; \
	)
endef
endif

define ATH10K_FIRMWARE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/lib/firmware/ath10k
	cp -r $(@D)/* $(TARGET_DIR)/lib/firmware/ath10k
	$(ATH10K_FIRMWARE_CREATE_SYMLINKS)
endef

$(eval $(generic-package))
