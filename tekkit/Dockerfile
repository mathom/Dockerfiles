FROM phusion/baseimage:0.9.9

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe restricted" > /etc/apt/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu precise-updates main universe restricted" >> /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu precise-security main universe restricted" >> /etc/apt/sources.list
RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y openjdk-7-jre-headless
RUN apt-get install -y unzip rsync curl
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /minecraft
RUN mkdir /minecraft-source
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN useradd -m -d /minecraft -p minecraft minecraft

WORKDIR /minecraft-source

# set up source directory for server files
RUN curl -s -L -o /tmp/tekkit.zip http://mirror.technicpack.net/Technic/servers/tekkitmain/Tekkit_Server_v1.2.8e.zip
RUN unzip /tmp/tekkit.zip
RUN curl -s -L -o /tmp/MCPC.jar http://ci.md-5.net/job/MCPC-Plus-164/lastSuccessfulBuild/artifact/eclipse/Forge/target/mcpc-plus-1.6.4-R2.1-forge965-B251.jar
RUN mv /tmp/MCPC.jar /minecraft-source

RUN mkdir -p /minecraft-source/plugins

# set up worldguard
RUN mkdir -p /minecraft-source/plugins/WorldGuard
RUN curl -s -L -o /tmp/worldguard.zip http://dev.bukkit.org/media/files/776/556/worldguard-5.9.zip
RUN cd /minecraft-source/plugins ; unzip /tmp/worldguard.zip WorldGuard.jar
ADD WorldGuard/config.yml /minecraft-source/plugins/WorldGuard/config.yml

# set up worldedit
RUN mkdir -p /minecraft-source/plugins/WorldEdit
RUN curl -s -L -o /tmp/worldedit.zip http://dev.bukkit.org/media/files/786/104/worldedit-5.6.2.zip
RUN cd /minecraft-source/plugins ; unzip /tmp/worldedit.zip WorldEdit.jar
ADD WorldEdit/config.yml /minecraft-source/plugins/WorldEdit/config.yml

# set up commandbook
RUN mkdir -p /minecraft-source/plugins/CommandBook
RUN curl -s -L -o /tmp/commandbook.zip http://dev.bukkit.org/media/files/719/267/commandbook-2.3.zip
RUN cd /minecraft-source/plugins ; unzip /tmp/commandbook.zip CommandBook.jar
ADD CommandBook/config.yml /minecraft-source/plugins/CommandBook/config.yml

# set up pex
RUN curl -s -L -o /tmp/PermissionsEx.jar http://dev.bukkit.org/media/files/785/958/PermissionsEx.jar
RUN mv /tmp/PermissionsEx.jar /minecraft-source/plugins
ADD PermissionsEx/config.yml /minecraft-source/plugins/Permissions/config.yml
ADD PermissionsEx/permissions.yml /minecraft-source/plugins/Permissions/permissions.yml

#set up modifyworld
RUN curl -s -L -o /tmp/ModifyWorld.jar http://dev.bukkit.org/media/files/730/259/Modifyworld.jar
RUN mv /tmp/ModifyWorld.jar /minecraft-source/plugins

ADD server.properties /minecraft-source/server.properties
RUN mkdir /etc/service/minecraft
ADD launch-minecraft.sh /etc/service/minecraft/run

RUN rm -f /tmp/*.zip

WORKDIR /minecraft

CMD ["/sbin/my_init"]

EXPOSE 25565
VOLUME ["/minecraft"]
