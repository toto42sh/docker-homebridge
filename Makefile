IMAGE='toto42sh/homebridge'
VERSION='1.1.1'

DOCKER_BUILD_CONTEXT='.'
DOCKER_FILE_PATH='Dockerfile'

.PHONY: pre-build docker-build post-build build \
        pre-push  docker-push  post-push  push

build: pre-build docker-build post-build

push: pre-push docker-push post-push

pre-build:

post-build:

pre-push:

post-push:

docker-build:
	docker build --tag $(IMAGE):$(VERSION) --rm $(DOCKER_BUILD_CONTEXT) -f $(DOCKER_FILE_PATH)
