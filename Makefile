# Nucleus Makefile


# Shell
SHELL := /bin/bash
#Project
PROJECT = "Nucleus"
#Version
RELEASE = "0.0.1"
#Authors
AUTHORS = "M.A. Hilaly"
# Path to source directory
NUCLEUS_PATH := .
# OS machine
OS_TYPE = 'uname -a'


setup-nls:
	@echo "Preparing Nucleus Setup"
	bash nucleus.sh setup
	@echo "Setup Completed"


drop-nls:
	@echo "Preparing for Nucleus Drop"
	bash nucleus.sh drop
	@echo "Uninstall completed"


drop-nls-keep-content:
	@echo "Preparing for nucleus Drop"
	bash nucleus.sh drop --keep-content
	@echo "Uninstall completed"


test-nls:
	@echo "Testing nucleus"


all: setup-nls


.PHONY: clean
