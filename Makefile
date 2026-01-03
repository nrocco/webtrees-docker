NAME = webtrees
DOCKER_IMAGE = docker.io/nrocco/$(NAME)
DOCKER_IMAGE_VERSION = latest

.PHONY: image
image:
	docker image build --pull $(BUILD_ARGS) \
		--tag "$(DOCKER_IMAGE):$(DOCKER_IMAGE_VERSION)" \
		.

.PHONY: push
push: image
	docker image push "$(DOCKER_IMAGE):$(DOCKER_IMAGE_VERSION)"
