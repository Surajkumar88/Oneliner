
PATH = /usr/local/bin

all:
	@echo Run \'make install\' to install OneLiner.

install:
	@mkdir -p $(PATH)
	@cp -p oneliner $(PATH)

uninstall:
	@rm -rf $(PATH)/oneliner
