all: build create start setup stop

build:
	@docker build --tag=piffall/pxe-sw .

create: # build
	@docker create --name="pxe-sw" --net="host" -p 69:69/udp -ti piffall/pxe-sw

start: # create
	@docker start pxe-sw

stop: # start
	@docker stop pxe-sw

setup: # start
	@docker exec -ti pxe-sw /srv/tftp/entrypoint.sh setup

install: # setup
	@cp pxe-sw.service /lib/systemd/system/
	@systemctl daemon-reload
	@systemctl start pxe-sw.service
	@systemctl enable pxe-sw.service

uninstall:
	@systemctl disable pxe-sw.service
	@rm /lib/systemd/system/pxe-sw.service
	@systemctl daemon-reload

