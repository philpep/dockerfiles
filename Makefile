DOCKERFILES=$(shell find * -type f -name Dockerfile)
NAMES=$(subst /,\:,$(subst /Dockerfile,,$(DOCKERFILES)))
REGISTRY?=r.philpep.org
IMAGES=$(addprefix $(REGISTRY)/,$(NAMES))
DEPENDS=.depends.mk
MAKEFLAGS += -rR
BUILDOPTS?=

.PHONY: all clean push pull run exec check checkrebuild $(NAMES) $(IMAGES)

all: $(NAMES)

clean:
	rm -f alpine/3.8/rootfs.tar.xz $(DEPENDS)

$(REGISTRY)/alpine\:3.8: alpine/3.8/rootfs.tar.xz

alpine/3.8/rootfs.tar.xz:
	$(MAKE) $(REGISTRY)/alpine:builder
	docker run --rm $(REGISTRY)/alpine:builder -r v3.8 -m http://dl-cdn.alpinelinux.org/alpine -b -t UTC \
		-p alpine-baselayout,busybox,alpine-keys,apk-tools,libc-utils -s > $@

$(DEPENDS): $(DOCKERFILES)
	grep '^FROM $(REGISTRY)/' $(DOCKERFILES) | \
		awk -F '/Dockerfile:FROM ' '{ print "$(REGISTRY)/" $$1 " " $$2 }' | \
		sed 's@:@\\:@g' | sed 's@ @: @g' > $@

sinclude $(DEPENDS)

$(NAMES): %: $(REGISTRY)/%
ifeq (push,$(filter push,$(MAKECMDGOALS)))
	echo docker push $<
endif
ifeq (run,$(filter run,$(MAKECMDGOALS)))
	docker run --rm -it $<
endif
ifeq (exec,$(filter exec,$(MAKECMDGOALS)))
	docker run --entrypoint sh --rm -it $<
endif
ifeq (check,$(filter check,$(MAKECMDGOALS)))
	./check_update.sh $<
endif

$(IMAGES): %:
ifeq (pull,$(filter pull,$(MAKECMDGOALS)))
	docker pull $@
else
	docker build $(BUILDOPTS) -t $@ $(subst :,/,$(subst $(REGISTRY)/,,$@))
endif
ifeq (checkrebuild,$(filter checkrebuild,$(MAKECMDGOALS)))
	./check_update.sh $@ || (BUILDOPTS=--no-cache $(MAKE) $@ && ./check_update.sh $@)
endif
