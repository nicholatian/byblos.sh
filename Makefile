#!/usr/bin/env make
#######################################################################
##                         xion.mt/byblos.sh                         ##
##                 Byblos v1 SDK installation script                 ##
##                                                                   ##
##               Copyright (C) 2024 Alexander Nicholi.               ##
##         Released under the Artisan Software Licence, v1.1         ##
##  Some rights reserved. See <https://asl.xion.mt/v1.1> for terms.  ##
#######################################################################

.PHONY: all tools check clean

CFILES := \
	util/chkascii.c
BINFILES := $(CFILES:.c=.bin)

TEXTFILES := \
	etc/BOILERPLATE \
	etc/epilogue.mk \
	etc/prologue.mk \
	src/byblos.sh \
	util/chkascii.c \
	.gitattributes \
	.gitignore \
	COPYING \
	Makefile \
	README.md

CHECKEDFILES := $(TEXTFILES:%=%.check)

all: check

%.check: % | $(BINFILES)
	cat $< | util/chkascii.bin --quiet

%.bin: %.c
	$(CC) -o $@ $<

tools: $(BINFILES)

check: $(CHECKEDFILES)

clean:
	$(RM) $(BINFILES)
