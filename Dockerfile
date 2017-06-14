FROM pataquets/ubuntu:xenial

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y --no-install-recommends install collectd tzdata vim  net-tools snmp snmp-mibs-downloader \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD files/etc/collectd/ /etc/collectd/

ENTRYPOINT [ "collectd", "-f" ]
