## Feature toggle for testig feature in development
## set to false by default
FEATURE_TOGGLE = false
ifeq ($(FEATURE_TOGGLE), false)

else
	ifeq ($(FEATURE_TOGGLE), true)

	endif
endif

requirements = version_check.sh

distro = $(shell uname)
# Setting the DESTDIR path based on the Distro detected
ifeq ($(distro), Linux)
	DESTDIR = /usr/bin
	MANDIR = /usr/share/man/man1
else 
	ifeq ($(distro), Darwin)
		DESTDIR = /usr/local/bin
		MANDIR = /usr/local/share/man/man1
	endif
endif
all:
	@echo Run \'make install\' to install OneLiner.
	@echo Note: You may have to run this as root.

install:
	@/bin/bash $(requirements)
	@mkdir -p $(DESTDIR)
	@cp -p oneliner $(DESTDIR)
	@cp -p oneliner.1 $(MANDIR)
	@echo "Oneliner v1.3.0 has been installed!!!"

uninstall:
	@rm -rf $(DESTDIR)/oneliner
	@rm -rf $(MANDIR)/oneliner.1
	@echo "All files related to Oneliner v1.3.0 have been removed."
