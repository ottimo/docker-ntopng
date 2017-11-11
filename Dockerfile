FROM armv7/armhf-ubuntu:16.04
MAINTAINER Matthew Mckenzie <mmckenzie@vostronet.com>

COPY qemu-arm-static /usr/bin/qemu-arm-static

RUN ["/usr/bin/qemu-arm-static", "/bin/sh", "-c", " \
    apt-get update && apt-get -y -q install wget lsb-release && \
    wget http://apt.ntop.org/16.04/all/apt-ntop.deb && \
    dpkg -i apt-ntop.deb && rm -rf apt-ntop.deb && \
    apt-get -y -q install ntopng ntopng-data tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*"]

COPY fritzdump.sh /

EXPOSE 3000

#CMD ["ntopng"]
CMD ["/fritzdump.sh"]
