TOPDIR := $(CURDIR)/
MAIN := $(TOPDIR)bin/main

$(MAIN): bin/main.o
	@mkdir -p $(@D)
	@$(CC) -m32 -coverage -o $@ $<

bin/main.o: main.c
	@mkdir -p $(@D)
	@$(CC) -m32 -c -coverage -o $@ $<

.PHONY: test
test: $(MAIN)
	@rm -rf bin/main.gcda
	@$(MAIN)

.PHONY: coverage
coverage: test
	@lcov -q -c -d $(TOPDIR) -o $(TOPDIR)/bin/lcov.info
