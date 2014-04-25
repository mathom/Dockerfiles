FROM mathom/ubuntu-jdk7

RUN apt-get install -y unzip wget rsync

RUN mkdir /minecraft
RUN mkdir /minecraft-source

WORKDIR /minecraft-source

# set up source directory for server files
RUN wget -O /tmp/tekkit.zip http://mirror.technicpack.net/Technic/servers/tekkitmain/Tekkit_Server_v1.2.8e.zip
RUN wget -O /minecraft-source/MCPC.jar http://ci.md-5.net/job/MCPC-Plus/lastStableBuild/artifact/build/distributions/mcpc-plus-1.7.2-R0.4-forge1033-B51.jar
RUN unzip /tmp/tekkit.zip

RUN mkdir -p /minecraft-source/plugins

# set up worldguard
RUN mkdir -p /minecraft-source/plugins/WorldGuard
RUN wget -O /tmp/worldguard.zip http://dev.bukkit.org/media/files/776/556/worldguard-5.9.zip
RUN cd /minecraft-source/plugins ; unzip /tmp/worldguard.zip WorldGuard.jar
ADD WorldGuard/config.yml /minecraft-source/plugins/WorldGuard/config.yml

# set up worldedit
RUN mkdir -p /minecraft-source/plugins/WorldEdit
RUN wget -O /tmp/worldedit.zip http://dev.bukkit.org/media/files/786/104/worldedit-5.6.2.zip
RUN cd /minecraft-source/plugins ; unzip /tmp/worldedit.zip WorldEdit.jar
ADD WorldEdit/config.yml /minecraft-source/plugins/WorldEdit/config.yml

# set up commandbook
RUN mkdir -p /minecraft-source/plugins/CommandBook
RUN wget -O /tmp/commandbook.zip http://dev.bukkit.org/media/files/719/267/commandbook-2.3.zip
RUN cd /minecraft-source/plugins ; unzip /tmp/commandbook.zip CommandBook.jar
ADD CommandBook/config.yml /minecraft-source/plugins/CommandBook/config.yml

ADD server.properties /minecraft-source/server.properties
ADD launch-minecraft.sh /minecraft-source/launch-minecraft.sh

RUN rm -f /tmp/*.zip

WORKDIR /minecraft

ENTRYPOINT ["/bin/bash", "-x", "/minecraft-source/launch-minecraft.sh"]

EXPOSE 25565
VOLUME ["/minecraft"]
