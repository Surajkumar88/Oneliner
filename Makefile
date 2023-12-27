
PATH = /usr

all:
	@echo Run \'make install\' to install OneLiner.

install:
	@mkdir -p $(PATH)/bin
	@cp -p oneliner $(PATH)/bin/oneliner

uninstall:
	@rm -rf $(PATH)/bin/oneliner
