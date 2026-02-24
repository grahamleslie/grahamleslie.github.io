.PHONY: build up down

CONTAINER_NAME := grahamleslie-blog
IMAGE_NAME := grahamleslie-blog:latest

build:
	docker build -t $(IMAGE_NAME) .

down:
	docker stop $(CONTAINER_NAME) 2>/dev/null || true
	docker rm $(CONTAINER_NAME) 2>/dev/null || true

up: down
	docker run \
		--name $(CONTAINER_NAME) \
		-p 4000:4000 \
		-v $(PWD):/workspace \
		$(IMAGE_NAME)
	@echo "Jekyll server running at http://localhost:4000"
