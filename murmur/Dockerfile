FROM phusion/baseimage:0.9.18

RUN add-apt-repository ppa:mumble/release
RUN apt-get update
RUN apt-get install -y mumble-server=1.2.12-1~ppa3~trusty1 pwgen m4

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /data

RUN mkdir /etc/service/murmur
ADD run.sh /etc/service/murmur/run

RUN mkdir -p /etc/my_init.d
#ADD upgrade.sh /etc/my_init.d/1_murmur_upgrade.sh
ADD config.sh /etc/my_init.d/2_murmur_config.sh

ADD murmur.ini /etc/default-murmur.ini

CMD ["/sbin/my_init"]
EXPOSE 64738
EXPOSE 64738/udp
VOLUME ["/data"]
