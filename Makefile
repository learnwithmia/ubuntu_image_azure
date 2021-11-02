NAME=ubuntu_image_azure
VERSION=0.0.2

PHONY: all
all: clean login build tag push clean

PHONY: login
login:
	cat temp/docker.txt | docker login --username playwithmia --password-stdin

PHONY: build
build:
	docker build . -t $(NAME):$(VERSION)

.PHONY: run
run:
	docker run -i -t --rm --name $(NAME) $(NAME):$(VERSION)

.PHONY: tag
tag:
	docker tag $(NAME):$(VERSION) playwithmia/$(NAME):$(VERSION)

.PHONY: push
push:
	docker push playwithmia/$(NAME):$(VERSION)

PHONY: clean
clean:
	./scripts/clean_script.sh
