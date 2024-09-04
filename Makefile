.PHONY: all
all: tcpdump webtrees

.PHONY: tcpdump
tcpdump:
	$(MAKE) -C $@

.PHONY: webtrees
webtrees:
	$(MAKE) -C $@
