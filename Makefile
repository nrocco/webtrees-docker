.PHONY: all
all: compass imagemagick tcpdump virt-install webtrees

.PHONY: compass
compass:
	$(MAKE) -C $@

.PHONY: imagemagick
imagemagick:
	$(MAKE) -C $@

.PHONY: tcpdump
tcpdump:
	$(MAKE) -C $@

.PHONY: virt-install
virt-install:
	$(MAKE) -C $@

.PHONY: webtrees
webtrees:
	$(MAKE) -C $@
