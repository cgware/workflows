TOPDIR := $(CURDIR)/
MAIN := $(TOPDIR)bin/main

$(MAIN): main.c
	@mkdir -p $(@D)
	@gcc -m32  -o $@ $<

.PHONY: test
test: $(MAIN)
	@$(MAIN)

.PHONY: coverage
coverage: test
	@lcov -q -c -d $(TOPDIR) -o $(TOPDIR)/bin/lcov.info
