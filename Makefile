THEOS_PACKAGE_DIR_NAME = debs
TARGET = :clang:7.0
ARCHS = armv7 armv7s arm64

include theos/makefiles/common.mk

TWEAK_NAME = Orangered
Orangered_FILES = Tweak.xm Listener.xm $(wildcard *.m) $(wildcard Communication/*.m)
Orangered_FRAMEWORKS = AudioToolbox CFNetwork CoreLocation Security StoreKit UIKit QuartzCore CoreGraphics SystemConfiguration Security MobileCoreServices
Orangered_PRIVATE_FRAMEWORKS = BulletinBoard
Orangered_CFLAGS = -fobjc-arc
Orangered_LDFLAGS = -L/usr/lib/ -lactivator
Orangered_LIBRARIES += z

include $(THEOS_MAKE_PATH)/tweak.mk
# SUBPROJECTS += ORPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 backboardd"

