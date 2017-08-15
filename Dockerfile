FROM	oraclelinux:7-slim
MAINTAINER	Donald Raikes <dockerdon60@gmail.com>

RUN		yum install -y yum-utils && \
		yum-config-manager --enable ol7_addons && \
		yum-config-manager --enable ol7_optional_latest && \
		yum install -y xorg-x11-server-Xvfb \
		firefox
