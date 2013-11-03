FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y git python
RUN mkdir /couchpotato

WORKDIR /couchpotato
VOLUME /couchpotato

RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git

EXPOSE 5050
ENTRYPOINT ["/usr/bin/python", "/couchpotato/CouchPotatoServer/CouchPotato.py"]
