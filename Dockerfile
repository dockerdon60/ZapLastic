FROM	oraclelinux:7-slim
MAINTAINER	Donald Raikes <dockerdon60@gmail.com>

RUN		yum install -y yum-utils && \
		yum-config-manager --enable ol7_addons && \
		yum-config-manager --enable ol7_optional_latest && \
		yum install -y xorg-x11-server-Xvfb \
		firefox

##	Install java 8u131
ENV JAVA_PKG=server-jre-8u*-linux-x64.tar.gz \
    JAVA_HOME=/usr/java/default

ADD files/$JAVA_PKG /usr/java/

RUN export JAVA_DIR=$(ls -1 -d /usr/java/*) && \
    ln -s $JAVA_DIR /usr/java/latest && \
    ln -s $JAVA_DIR /usr/java/default && \
    alternatives --install /usr/bin/java java $JAVA_DIR/bin/java 20000 && \
    alternatives --install /usr/bin/javac javac $JAVA_DIR/bin/javac 20000 && \
    alternatives --install /usr/bin/jar jar $JAVA_DIR/bin/jar 20000
