PREFIX    = /usr/local
BINPREFIX = $(DESTDIR)$(PREFIX)/bin
T2P    		= tex2pdf

all:

install:
	install -d ${BINPREFIX}
	install ${T2P} ${BINPREFIX}

uninstall:
	rm -f $(T2P)/bin/${SCRIPT}

.PHONY: all install uninstall
