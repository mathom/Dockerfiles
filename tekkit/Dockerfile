FROM mathom/ubuntu-jdk7

RUN apt-get install -y unzip wget rsync

RUN mkdir /minecraft
RUN mkdir /minecraft-source

WORKDIR /minecraft-source

RUN wget -O /tmp/tekkit.zip http://mirror.technicpack.net/Technic/servers/tekkitmain/Tekkit_Server_v1.1.10.zip
#ADD Tekkit_Server_v1.1.10.zip /tmp/tekkit.zip
RUN unzip /tmp/tekkit.zip

ADD server.properties /minecraft-source/server.properties
ADD launch-minecraft.sh /minecraft-source/launch-minecraft.sh

WORKDIR /minecraft

ENTRYPOINT ["/bin/bash", "-x", "/minecraft-source/launch-minecraft.sh"]

EXPOSE 25565
VOLUME ["/minecraft"]
