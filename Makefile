all: build

build:
	@docker build --tag=piffall/pxe-sw .
