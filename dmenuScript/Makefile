PREFIX    = /usr/local
BINPREFIX = $(DESTDIR)$(PREFIX)/bin
GOOGLE    = dmenuduckduckgo
DDG    		= dmenugoogle

all:

install:
	install -d ${BINPREFIX}
	install ${GOOGLE} ${BINPREFIX}
	install ${DDG} ${BINPREFIX}

uninstall:
	rm -f $(GOOGLE)/bin/${SCRIPT}
	rm -f $(DDG)/bin/${SCRIPT}

.PHONY: all install uninstall
