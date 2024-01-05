## Feature toggle for progress bar dev
## set to false by default
PROGRESS_TOGGLE = true
ifeq ($(PROGRESS_TOGGLE), false)
	requirements = require_install.sh
else
	ifeq ($(PROGRESS_TOGGLE), true)
		requirements = require_install_toggle.sh
	endif
endif


distro = $(shell uname)
# Setting the DESTDIR path based on the Distro detected
ifeq ($(distro), Linux)
	DESTDIR = /usr/bin
else 
	ifeq ($(distro), Darwin)
		DESTDIR = /usr/local/bin
	endif
endif
all:
	@echo Run \'make install\' to install OneLiner.
	@echo Note: You may have to run this as root.

install:
	@/bin/bash $(requirements)
	@mkdir -p $(DESTDIR)
	@cp -p oneliner $(DESTDIR)
	@echo "Oneliner v1.2.0 has been installed!!!"

uninstall:
	@rm -rf $(DESTDIR)/oneliner
	@echo "All files related to Oneliner v1.2.0 have been removed."
