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
# Date    : 2018-04-17
# version : 0.0.1 
#
# ifcdaqdrv2 repository follows EPICS standard structure
# 

where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(where_am_I)/../configure/DECOUPLE_FLAGS


ifneq ($(strip $(TSCLIB_DEP_VERSION)),)
tsclib_VERSION=$(TSCLIB_DEP_VERSION)
endif


APP:=ifcdaqdrv2
APP2:=ifcdaqdrv2App
APPDB:=$(APP2)/Db
APPSRC:=$(APP2)/src


USR_INCLUDES += -I$(where_am_I)$(APPSRC)
#USR_CXXFLAGS += -std=gnu++11


# USR_CFLAGS   += -Wno-unused-variable
# USR_CFLAGS   += -Wno-unused-function
# USR_CFLAGS   += -Wno-unused-but-set-variable
# USR_CPPFLAGS += -Wno-unused-variable
# USR_CPPFLAGS += -Wno-unused-function
# USR_CPPFLAGS += -Wno-unused-but-set-variable

TEMPLATES += $(wildcard $(APPDB)/FIM*.template)
TEMPLATES += $(wildcard $(APPDB)/restore*.template)

HEADERS = $(APPSRC)/ifcdaqdrv2.h
HEADERS += $(APPSRC)/ifcfastintdrv2.h

SOURCES += $(APPSRC)/debugEpics.c
SOURCES += $(APPSRC)/ifcdaqdrv.c
SOURCES += $(APPSRC)/ifcdaqdrv_acq420.c
SOURCES += $(APPSRC)/ifcdaqdrv_adc3110.c
SOURCES += $(APPSRC)/ifcdaqdrv_adc3112.c
SOURCES += $(APPSRC)/ifcdaqdrv_adc3117.c
SOURCES += $(APPSRC)/ifcdaqdrv_dio3118.c 
SOURCES += $(APPSRC)/ifcdaqdrv_fmc.c
SOURCES += $(APPSRC)/ifcdaqdrv_scope.c
SOURCES += $(APPSRC)/ifcdaqdrv_utils.c
SOURCES += $(APPSRC)/ifcfastintdrv.c
SOURCES += $(APPSRC)/ifcfastintdrv_utils.c




# db rule is the default in RULES_E3, so add the empty one

db:
