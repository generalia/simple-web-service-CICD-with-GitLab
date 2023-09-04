# Makefile for Node.js service

# Variables
SERVICE=nodejs-web-app
DOCKER_IMAGE_NAME = nodejs-web-app
DOCKER_TAG = latest
export VERSION?=unknown

.PHONY: all build run test clean

all: build

build:
	@echo "Building Docker image for Node.js service..."
	docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_TAG) .

run:
	@echo "Running Docker image for Node.js service.."
	docker run -p 3000:3000 -d nodejs-web-app

test:
	@echo "Running tests for Node.js service..."
	npm install --save-dev mocha chai chai-http 
	npm test

clean:
	-docker rmi -f $(SERVICE):$(VERSION) $(SERVICE):latest 