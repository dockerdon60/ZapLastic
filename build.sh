#!/bin/bash
docker build --force-rm=true --compress \
	--build-arg HTTP_PROXY=$HTTP_PROXY \
	--build-arg HTTPS_PROXY=$HTTPS_PROXY \
	--build-arg http_proxy=$HTTP_PROXY \
	--build-arg HTTPS_PROXY=$HTTPS_PROXY \
	-t dockerdon60/zaplastic .
