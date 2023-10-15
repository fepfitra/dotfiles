PREFIX    = /usr/local
BINPREFIX = $(DESTDIR)$(PREFIX)/bin
SHORT  		= short
LOC    		= cl
UPLOAD  	= upload

all:

install:
	install -d ${BINPREFIX}
	install ${SHORT} ${BINPREFIX}
	install ${LOC} ${BINPREFIX}
	install ${UPLOAD} ${BINPREFIX}

uninstall:
	rm -f $(SHORT)/bin/${SCRIPT}
	rm -f $(LOC)/bin/${SCRIPT}
	rm -f $(UPLOAD)/bin/${SCRIPT}

.PHONY: all install uninstall
