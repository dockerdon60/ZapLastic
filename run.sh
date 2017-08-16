#!/bin/bash
docker run --rm --name zaplastic \
	-e HTTP_PROXY=$HTTP_PROXY \
	-e HTTPS_PROXY=$HTTPS_PROXY \
	-e http_proxy=$HTTP_PROXY \
	-e HTTPS_PROXY=$HTTPS_PROXY \
	-p 5601:5601 -p 9200:9200 -p 9300:9300 \
	-it dockerdon60/zaplastic bash
