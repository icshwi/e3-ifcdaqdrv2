
where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(REQUIRE_TOOLS)/driver.makefile

APP:=ifcdaqdrv2
APPSRC:=src
APPINC:=include

USR_INCLUDES += -I$(APPINC)

SOURCES = $(wildcard $(APPSRC)/*.c)
HEADERS = $(wildcard $(APPSRC)/*.h)
HEADERS = $(wildcard $(APPINC)/*.h)

# Enable debug, disabled by default.
HOST_OPT = YES
CROSS_OPT = YES

