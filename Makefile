# Makefile for nInvaders
# Copyright (C) 2003 Sebastian Gutsfeld, Alexander Hollinger

.POSIX:
CC     = cc
CFLAGS = -I. -g -O2
LIBS   = -lncurses 

PREFIX ?= /usr/local
MANPREFIX ?= $(PREFIX)/man/man6

TARG = nInvaders
CFILES = globals.c view.c aliens.c ufo.c player.c highscore.c nInvaders.c
HFILES = globals.h view.h aliens.h ufo.h player.h highscore.h nInvaders.h
OFILES = globals.o view.o aliens.o ufo.o player.o highscore.o nInvaders.o
MANFILES = nInvaders.6

all:		$(TARG)

$(TARG): 	$(OFILES) $(HFILES)
		$(CC) $(LDFLAGS) -o$@ $(OFILES) $(LIBS)

hs:		file.o
		$(CC) $(LDFLAGS) -o$@ file.o $(LIBS)

.c.o:
		$(CC) -c  $(CFLAGS) $(OPTIONS) $<
clean:
		rm -f nInvaders $(OFILES)

distclean:
	        rm -f nInvaders $(OFILES)
		rm -f Makefile config.h config.status config.cache config.log

install:
	cp -fv $(MANFILES) $(MANPREFIX)
	cp -fv $(TARG) $(PREFIX)/bin

uninstall:
	rm -fv $(MANPREFIX)$(MANFILES) $(PREFIX)/bin/$(TARG)

.PHONY: all clean distclean install uninstall
