DOCKERFILES=$(shell find * -type f -name Dockerfile)
NAMES=$(subst /,\:,$(subst /Dockerfile,,$(DOCKERFILES)))
REGISTRY?=r.in.philpep.org
IMAGES=$(addprefix $(subst :,\:,$(REGISTRY))/,$(NAMES))
DEPENDS=.depends.mk
MAKEFLAGS += -rR

.PHONY: all clean push pull run exec check checkrebuild pull-base ci $(NAMES) $(IMAGES)

all: $(NAMES)

help:
	@echo "A smart Makefile for your dockerfiles"
	@echo ""
	@echo "Read all Dockerfile within the current directory and generate dependendies automatically."
	@echo ""
	@echo "make all              ; build all images"
	@echo "make nginx            ; build nginx image"
	@echo "make push all         ; build and push all images"
	@echo "make push nginx       ; build and push nginx image"
	@echo "make run nginx        ; build and run nginx image (for testing)"
	@echo "make exec nginx       ; build and start interactive shell in nginx image (for debugging)"
	@echo "make checkrebuild all ; build and check if image has update availables (using apk or apt-get)"
	@echo "                        and rebuild with --no-cache is image has updates"
	@echo "make pull-base        ; pull base images from docker hub used to bootstrap other images"
	@echo "make ci               ; alias to make pull-base checkrebuild push all"
	@echo ""
	@echo "You can chain actions, typically in CI environment you want make checkrebuild push all"
	@echo "which rebuild and push only images having updates availables."

clean:
	rm -f alpine/3.10/rootfs.tar.xz
	rm -f $(DEPENDS)

$(subst :,\:,$(REGISTRY))/alpine\:3.10: alpine/3.10/rootfs.tar.xz

pull-base:
	# used by alpine:builder
	docker pull alpine:3.10
	# used by debian:buster-slim
	docker pull debian:buster-slim
	# used by keycloak
	docker pull jboss/keycloak:7.0.0
	# used by jenkins
	docker pull jenkins/jenkins:lts-alpine

ci:
	$(MAKE) pull-base checkrebuild push all

alpine/3.10/rootfs.tar.xz:
	$(MAKE) $(REGISTRY)/alpine:builder
	docker run --rm $(REGISTRY)/alpine:builder -r v3.10 -m http://dl-cdn.alpinelinux.org/alpine -b -t UTC \
		-p alpine-baselayout,busybox,alpine-keys,apk-tools,libc-utils -s > $@

.PHONY: $(DEPENDS)
$(DEPENDS): $(DOCKERFILES)
	grep '^FROM \$$REGISTRY/' $(DOCKERFILES) | \
		awk -F '/Dockerfile:FROM \\$$REGISTRY/' '{ print $$1 " " $$2 }' | \
		sed 's@[:/]@\\:@g' | awk '{ print "$(subst :,\\:,$(REGISTRY))/" $$1 ": " "$(subst :,\\:,$(REGISTRY))/" $$2 }' > $@

sinclude $(DEPENDS)

$(NAMES): %: $(REGISTRY)/%
ifeq (push,$(filter push,$(MAKECMDGOALS)))
	docker push $<
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
	docker build --build-arg REGISTRY=$(REGISTRY) -t $@ $(subst :,/,$(subst $(REGISTRY)/,,$@))
endif
ifeq (checkrebuild,$(filter checkrebuild,$(MAKECMDGOALS)))
	./check_update.sh $@ || (docker build --build-arg REGISTRY=$(REGISTRY) --no-cache -t $@ $(subst :,/,$(subst $(REGISTRY)/,,$@)) && ./check_update.sh $@)
endif
