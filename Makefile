IMAGES=$(shell find * -type f -name Dockerfile -printf '%h\n' | sed 's@/@\\:@g')
REGISTRY?=r.philpep.org
ALPINE_DEPENDS=$(shell find * -name Dockerfile | xargs grep -l '^FROM $(REGISTRY)/alpine:3.8' | xargs dirname | sed 's@/@:@g')
DEBIAN_DEPENDS=$(shell find * -name Dockerfile | xargs grep -l '^FROM $(REGISTRY)/debian:stretch-slim' | xargs dirname | sed 's@/@:@g')
MAKEFLAGS += -rR

.PHONY: all clean push pull run exec check checkrebuild $(IMAGES) $(addprefix $(REGISTRY)/,$(IMAGES))

all: $(IMAGES)

clean:
	rm -f alpine/3.8/rootfs.tar.xz

$(REGISTRY)/alpine\:3.8: alpine/3.8/rootfs.tar.xz

alpine/3.8/rootfs.tar.xz:
	$(MAKE) $(REGISTRY)/alpine:builder
	docker run --rm $(REGISTRY)/alpine:builder -r v3.8 -m http://dl-cdn.alpinelinux.org/alpine -b -t UTC \
		-p alpine-baselayout,busybox,alpine-keys,apk-tools,libc-utils -s > $@

$(addprefix $(REGISTRY)/,$(ALPINE_DEPENDS)): $(REGISTRY)/alpine\:3.8

$(addprefix $(REGISTRY)/,$(DEBIAN_DEPENDS)): $(REGISTRY)/debian\:stretch-slim

$(IMAGES): %: $(REGISTRY)/%
ifeq (push,$(filter push,$(MAKECMDGOALS)))
	docker push $(REGISTRY)/$@
endif
ifeq (run,$(filter run,$(MAKECMDGOALS)))
	docker run --rm -it $(REGISTRY)/$@
endif
ifeq (exec,$(filter exec,$(MAKECMDGOALS)))
	docker run --entrypoint sh --rm -it $(REGISTRY)/$@
endif
ifeq (check,$(filter check,$(MAKECMDGOALS)))
	docker run --entrypoint sh -u root -v $(shell pwd)/check_update.sh:/check_update.sh --rm $(REGISTRY)/$@ /check_update.sh
endif

$(addprefix $(REGISTRY)/,$(IMAGES)): %:
ifeq (pull,$(filter pull,$(MAKECMDGOALS)))
	docker pull $@
else
	docker build -t $@ $(subst :,/,$(subst $(REGISTRY)/,,$@))
endif
ifeq (checkrebuild,$(filter checkrebuild,$(MAKECMDGOALS)))
	@(if docker run --entrypoint sh -u root -v $(shell pwd)/check_update.sh:/check_update.sh --rm $@ /check_update.sh | grep 'upgradable from'; then \
		echo $@ need rebuild; docker build --no-cache -t $@ $(subst :,/,$(subst $(REGISTRY)/,,$@)); else echo $@ is up-to-date; fi)
	@(if docker run --entrypoint sh -u root -v $(shell pwd)/check_update.sh:/check_update.sh --rm $@ /check_update.sh | grep 'upgradable from'; then \
		echo failed to rebuild $@; fi)
endif
