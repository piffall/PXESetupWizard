#!/bin/bash
docker create --name="pxe-sw" --net="host" -p 69:69/udp -ti piffall/pxe-sw
