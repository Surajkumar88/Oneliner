
distro = $(shell uname)
ifeq ($(distro), Linux)
	PATH = /usr/bin
else 
	ifeq ($(distro), Darwin)
		PATH = /usr/local/bin
	endif
endif
all:
	echo Run \'make install\' to install OneLiner.

install:
	@mkdir -p $(PATH)
	@cp -p oneliner $(PATH)

uninstall:
	@rm -rf $(PATH)/oneliner
