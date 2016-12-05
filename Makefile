DPKG_DEST = ~/build
PREFIX = $(DPKG_DEST)/vector-utils

BINPREFIX = $(PREFIX)/usr/bin
ETCPREFIX = $(PREFIX)/etc

all: 
        echo

$(BINPREFIX) $(ETCPREFIX):
        sudo mkdir -p $@

install: all $(BINPREFIX) $(ETCPREFIX)
        sudo cp usr/bin/* $(BINPREFIX)/
        sudo cp etc/* $(ETCPREFIX)/
        sudo chmod 755 $(BINPREFIX)/*

clean:
        echo

deb: install
        vi DEBIAN/control
        sudo cp -R DEBIAN $(PREFIX)/
        sudo dpkg-deb --build $(PREFIX) $(DPKG_DEST)

deb-clean: clean
        sudo rm -rf $(BINPREFIX)/* $(ETCPREFIX)/*

