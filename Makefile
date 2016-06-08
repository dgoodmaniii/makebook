# +AMDG
#
# This document was begun on 8 June 1200, and it is humbly
# dedicated to St. Wulfric of Haselbury, patron of
# bookbinders, for his prayers, and to the Sacred Heart of
# Jesus, for His mercy.

SHELL=/bin/sh
TROFF=groff
TROFFFLAGS=-man
SRCDIR=./
prefix=/usr/local
exec_prefix=$(prefix)
bindir=$(prefix)/bin
datarootdir=$(prefix)/share
datadir=$(datarootdir)
docdir=$(datarootdir)/doc/makebook
mandir=$(datarootdir)/man
binfiles=makebook
manfiles=makebook.1
othdocs=makebook_man.html

install :
	cp $(binfiles) $(bindir)
	cp $(manfiles) $(mandir)/man1
	test -d $(docdir) || mkdir -p $(docdir)
	cp $(othdocs) $(docdir)

uninstall :
	rm $(bindir)/$(binfiles)
	rm $(mandir)/man1/$(manfiles)
	rm -R $(docdir)

doc :
	groff -man -Tascii -a makebook.1 > makebook_man.txt;
	groff -man -Thtml makebook.1 > makebook_man.html;
