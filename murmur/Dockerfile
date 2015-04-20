FROM phusion/baseimage:0.9.16

RUN add-apt-repository ppa:mumble/release
RUN apt-get update
RUN apt-get install -y mumble-server=1.2.8-1~ppa1~trusty1 pwgen

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /data
RUN mkdir /etc/service/murmur
ADD murmur.sh /etc/service/murmur/run

CMD ["/sbin/my_init"]
EXPOSE 64738
VOLUME ["/data"]
