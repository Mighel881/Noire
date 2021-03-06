export TARGET = iphone:latest:12.0
export ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = Preferences

ifneq ($(RESPRING),0)
	INSTALL_TARGET_PROCESSES += SpringBoard
endif

export ADDITIONAL_CFLAGS = -DTHEOS_LEAN_AND_MEAN -fobjc-arc

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Noire
$(TWEAK_NAME)_FILES = $(wildcard *.[xm])
$(TWEAK_NAME)_EXTRA_FRAMEWORKS = Cephei
$(TWEAK_NAME)_CFLAGS = -IHeaders
$(TWEAK_NAME)_LDFLAGS = $(wildcard *.tbd)

BUNDLE_NAME = com.shade.noire
$(BUNDLE_NAME)_INSTALL_PATH = /Library/Application Support/

SUBPROJECTS = Settings

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS)/makefiles/bundle.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
ifeq ($(RESPRING),0)
	install.exec "uiopen 'prefs:root=Noire'"
endif