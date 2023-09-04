# Makefile for Go service

# Variables
SERVICE=go-web-app
DOCKER_IMAGE_NAME = go-web-app
DOCKER_TAG = latest
export VERSION?=unknown

.PHONY: all build run test clean

all: build

build:
	@echo "Building Docker image for Go service..."
	docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_TAG) .

run:
	@echo "Running Docker image for Go service.."
	docker run -p 8080:8080 -d go-web-app

test:
	@echo "Running tests for Go service..."
	go test -v .

clean:
	-docker rmi -f $(SERVICE):$(VERSION) $(SERVICE):latest 