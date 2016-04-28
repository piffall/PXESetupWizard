FROM ubuntu:16.04
MAINTAINER Cristòfol Torrens "piffall@gmail.com"

RUN apt-get update
RUN apt-get -y install git tftpd-hpa unzip wget curl p7zip-full xzip xz-utils cpio

WORKDIR /srv/tftp
ADD . /srv/tftp

ENTRYPOINT ["/srv/tftp/entrypoint.sh"]
CMD ["start"]

EXPOSE 69/udp
