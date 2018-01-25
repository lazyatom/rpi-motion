#!/bin/sh

IMAGE_NAME=arunderwood/rpi-motion

docker run -d --device=/dev/video0:/dev/video0 -p 8081:8081 $IMAGE_NAME
