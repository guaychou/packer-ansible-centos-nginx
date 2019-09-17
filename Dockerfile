FROM centos:latest
MAINTAINER kevinchou

LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install genisoimage isomd5sum && \
    yum clean all

ADD masak.sh /usr/bin/masak.sh
RUN chmod -v +x /usr/bin/masak.sh

ENTRYPOINT [ "/usr/bin/masak2.sh" ]