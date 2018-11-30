.PHONY: build cluster test

default: build

build:
	go build -o bin/swarm    github.com/cvbdynasty/cvbEth/cmd/swarm
	go build -o bin/geth     github.com/cvbdynasty/cvbEth/cmd/geth
	go build -o bin/bootnode github.com/cvbdynasty/cvbEth/cmd/bootnode

cluster: build
	scripts/boot-cluster.sh

test:
	go test -v github.com/cvbdynasty/cvbEth/swarm/...
