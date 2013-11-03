FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# Fake a fuse install
RUN apt-get install libfuse2
RUN cd /tmp ; apt-get download fuse
RUN cd /tmp ; dpkg-deb -x fuse_* .
RUN cd /tmp ; dpkg-deb -e fuse_*
RUN cd /tmp ; rm fuse_*.deb
RUN cd /tmp ; echo -en '#!/bin/bash\nexit 0\n' > DEBIAN/postinst
RUN cd /tmp ; dpkg-deb -b . /fuse.deb
RUN cd /tmp ; dpkg -i /fuse.deb

RUN apt-get install -y openjdk-7-jre unzip wget
RUN mkdir /minecraft

VOLUME /minecraft
WORKDIR /minecraft

RUN echo workdir is $PWD
RUN wget -O /tmp/tekkit.zip http://mirror.technicpack.net/Technic/servers/tekkitmain/Tekkit_Server_v1.1.10.zip
RUN unzip /tmp/tekkit.zip

ADD server.properties /minecraft/server.properties

EXPOSE 25565
CMD java -Xmx3G -Xms2G -jar Tekkit.jar nogui
