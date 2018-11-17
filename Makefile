.PHONY: build

IMAGE_NAME = mozc_ut2
MAJOR_VERSION = bionic

build: ## build mozc_ut2
	@echo -e "\nbuilding mozc-ut2 package..\n"	
	docker build -t "local/$(IMAGE_NAME):$(MAJOR_VERSION)" . && \
  docker run -d --name mozc_ut2 local/$(IMAGE_NAME):$(MAJOR_VERSION) && \
	docker cp mozc_ut2:/app/ ./deb/ && \
	docker rm mozc_ut2 && \
	echo "\n" && \
	echo "Successfully built! See ./deb/ and install packages"

.DEFAULT_GOAL := build
