FROM phusion/baseimage
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y postfix syslog-ng
RUN useradd vmail


EXPOSE 25
VOLUME /data

RUN mkdir -p /etc/my_init.d
ADD postfix /etc/my_init.d/postfix
RUN chmod +x /etc/my_init.d/postfix

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


