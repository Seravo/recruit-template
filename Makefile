APT_PROXY ?=
DOCKER ?= docker
IMAGE ?= ypcs/FIXME:latest
CONTAINER ?= FIXME

all:

clean:
	$(DOCKER) rm -f "$(CONTAINER)" || :

build:
	$(DOCKER) build --build-arg APT_PROXY="$(APT_PROXY)" -t $(IMAGE) .

run: clean
	$(DOCKER) run --name "$(CONTAINER)" --rm --volume "$(shell pwd)/app/:/app/:ro" -p 127.0.42.1:8080:8080 -d $(IMAGE)

reload:
	$(DOCKER) exec "$(CONTAINER)" touch /tmp/reload-app

logs:
	$(DOCKER) logs "$(CONTAINER)"
