FROM	oraclelinux
MAINTAINER	Donald Raikes <dockerdon60@gmail.com>

RUN		yum-config-manager --enable ol7_addons && \
		yum-config-manager --enable ol7_optional_latest && \
		yum install -y xorg-x11-server-Xvfb \
			firefox redhat-lsb dbus

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

##	Add elasticsearch to the container
RUN		rpm -iv https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.5.1.rpm 

COPY		elasticsearch.yml /etc/elasticsearch/
VOLUME	{"/usr/share/elasticsearch/data","/var/log/elasticsearch"}
#ENTRYPOINT	{"/etc/init.d/elasticsearch","start"}
