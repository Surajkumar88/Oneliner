
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
	@mkdir -p $(DESTDIR)
	@cp -p oneliner $(DESTDIR)
	@echo Checking Dependencies...
	@bash require_install.sh
	@echo Dependencies are installed
	@echo "Oneliner v1.0.0 has been installed!!!"

uninstall:
	@rm -rf $(DESTDIR)/oneliner
	@echo "All files related to Oneliner v1.0.0 have been removed."
