
where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(REQUIRE_TOOLS)/driver.makefile

APP:=ifcdaqdrv2
APPSRC:=src
APPINC:=include	

# WHY $(APPINC) DONT WORK???
USR_INCLUDES += -Iinclude

SOURCES = $(wildcard src/*.c)
HEADERS = $(wildcard include/*.h)

# Enable debug, disabled by default.
HOST_OPT = YES
CROSS_OPT = YES

