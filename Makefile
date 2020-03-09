# -include .env

# VERSION := $(shell git describe --tags)
BUILD := $(shell git rev-parse --short HEAD)
PROJECTNAME := $(shell basename "$(PWD)")

# Go related variables.
# GOBASE := $(shell pwd)
GOPATH := $(HOME)/go
GOBIN := $(GOPATH)/bin

# Go parameters
GOCMD=go
GOMOD=$(GOCMD) mod
GOBUILD=$(GOCMD) build
GOINSTALL=$(GOCMD) install
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get

# Determine build OS
ifeq ($(OS),Windows_NT) 
    detected_OS := Windows
else
    detected_OS := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
endif

.DEFAULT_GOAL := help

# all: test build
# build:
#         $(GOBUILD) -o $(BINARY_NAME) -v
# test:
#         $(GOTEST) -v ./...

## clean: Clean
clean:
	@echo no clean actions
#   @GOPATH=$(GOPATH) GOBIN=$(GOBIN) $(GOCLEAN) ./..
#         rm -f $(BINARY_NAME)
#         rm -f $(BINARY_UNIX)

deps:
	$(GOMOD) download

## build: blah
build:
	@GOPATH=$(GOPATH) $(GOINSTALL) ./...


.PHONY: help

all: help

help: Makefile
	@echo
	@echo " Choose a command run in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo
