TOPDIR := $(CURDIR)/
MAIN := $(TOPDIR)bin/main

$(MAIN): main.c
	@mkdir -p $(@D)
	@gcc -m32  -o $@ $<

.PHONY: test
test: $(MAIN)
	@$(MAIN)
