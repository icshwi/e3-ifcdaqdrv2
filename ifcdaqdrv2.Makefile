#
#  Copyright (c) 2017 - Present  European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# 
# Author  : Joao Paulo Martins
# email   : joaopaulomartins@esss.se
# Date    : 2019-09-26
# version : 0.0.2 
#
# ifcdaqdrv2 repository follows EPICS standard structure
# 

where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(E3_REQUIRE_CONFIG)/DECOUPLE_FLAGS


ifneq ($(strip $(TSCLIB_DEP_VERSION)),)
tsclib_VERSION=$(TSCLIB_DEP_VERSION)
endif

ifeq ($(E3_MODULE_VERSION),3.0.4)
	APP:=ifcdaqdrv2App
else
	APP:=ifcdaqdrvApp
endif

APPDB:=$(APP)/Db
APPSRC:=$(APP)/src


USR_INCLUDES += -I$(where_am_I)$(APPSRC)
#USR_CXXFLAGS += -std=gnu++11


# USR_CFLAGS   += -Wno-unused-variable
# USR_CFLAGS   += -Wno-unused-function
# USR_CFLAGS   += -Wno-unused-but-set-variable
# USR_CPPFLAGS += -Wno-unused-variable
# USR_CPPFLAGS += -Wno-unused-function
# USR_CPPFLAGS += -Wno-unused-but-set-variable


ifeq ($(E3_MODULE_VERSION),3.0.4)
	HEADERS = $(APPSRC)/ifcdaqdrv2.h
else
	HEADERS = $(APPSRC)/ifcdaqdrv.h
endif
HEADERS += $(APPSRC)/ifcfastintdrv2.h

SOURCES += $(APPSRC)/debugEpics.c
SOURCES += $(APPSRC)/ifcdaqdrv.c
SOURCES += $(APPSRC)/ifcdaqdrv_adc3110.c
SOURCES += $(APPSRC)/ifcdaqdrv_adc3112.c
SOURCES += $(APPSRC)/ifcdaqdrv_adc3117.c
SOURCES += $(APPSRC)/ifcdaqdrv_dio3118.c 
SOURCES += $(APPSRC)/ifcdaqdrv_fmc.c
SOURCES += $(APPSRC)/ifcdaqdrv_scope.c
SOURCES += $(APPSRC)/ifcdaqdrv_utils.c
SOURCES += $(APPSRC)/ifcfastintdrv.c
SOURCES += $(APPSRC)/ifcfastintdrv_utils.c

ifeq ($(E3_MODULE_VERSION),3.0.4)
	SOURCES += $(APPSRC)/ifcdaqdrv_acq420.c
else
	SOURCES += $(APPSRC)/ifcdaqdrv_scope_lite.c
	SOURCES += $(APPSRC)/ifcdaqdrv_gen_scope.c
	SOURCES += $(APPSRC)/ifcdaqdrv_scope4ch.c
	SOURCES += $(APPSRC)/ifcdaqdrv_scope20ch.c
endif

# db rule is the default in RULES_E3, so add the empty one

db:
#
.PHONY: vlibs
vlibs:
#
