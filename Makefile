.DEFAULT_GOAL := help

.PHONY: all help build clean run

IMAGES	:= $(wildcard *.json)
DISKS	:= $(patsubst %.json, %.qcow2, $(IMAGES))

all:

help:  ## display this help
	@cat $(MAKEFILE_LIST) | grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' | \
		sort -k1,1 | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: | $(DISKS)  ## build all vagrant boxes

clean:  ## remove all images
	rm packer
	rm -f *.qcow2
	rm -rf output/

%.qcow2: %.json | packer
	./packer build $<
	mv output/$@ .
	rm -rf output/

packer: | .packer.zip  ## install hashicorp packer to local directory
	unzip .packer.zip
	rm .packer.zip

.packer.zip:
	wget -O .packer.zip https://releases.hashicorp.com/packer/0.12.3/packer_0.12.3_linux_amd64.zip
