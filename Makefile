.PHONY: all test-ci

all: build-local

test: install-deps fmt lint vet
	@echo "+ $@"
	@go test -race -v

test-ci:
	@echo "+ $@"
	make test
	make build-local

build-local:
	@mkdir -p "bin"
	go build -i -o "bin/cos" ./

install-deps:
	@echo "+ $@"
	@go get -u github.com/golang/lint/golint
	@go get -u github.com/tools/godep
	@go get -u golang.org/x/tools/cmd/cover
	@go get -u github.com/mattn/goveralls
	@go get -d ./...

lint:
	@echo "+ $@"
	@test -z "$$(golint ./... | grep -v vendor/ | tee /dev/stderr)"

fmt:
	@echo "+ $@"
	@test -z "$$(gofmt -s -l . | grep -v vendor/ | tee /dev/stderr)"

vet:
	@echo "+ $@"
	@go vet ./

clean:
	@if [ -d bin ]; then \
		echo "Removing binaries"; \
		rm -rf bin; \
	fi
