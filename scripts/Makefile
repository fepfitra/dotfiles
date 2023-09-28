PREFIX    = /usr/local
BINPREFIX = $(DESTDIR)$(PREFIX)/bin
SHORT    		= short
LOC    		= cl

all:

install:
	install -d ${BINPREFIX}
	install ${SHORT} ${BINPREFIX}
	install ${LOC} ${BINPREFIX}

uninstall:
	rm -f $(SHORT)/bin/${SCRIPT}
	rm -f $(LOC)/bin/${SCRIPT}

.PHONY: all install uninstall
