FROM ubuntu-upstart:14.04

EXPOSE 9981

RUN apt-get update && apt-get install -y \
    build-essential \
    hdhomerun-config \
    python-software-properties \
    libavahi-client3 \
    libavahi-common3 \
    liburiparser1 \
    curl \
    software-properties-common

RUN curl http://apt.tvheadend.org/repo.gpg.key | apt-key add -

RUN apt-add-repository ppa:r3gis-r3gis/dvbhdhomerun && apt-add-repository http://apt.tvheadend.org/unstable

RUN dpkg-divert --local --rename --add /sbin/initctl && \
    ln -s /bin/true /sbin/initctl

RUN apt-get update && apt-get install -y dvbhdhomerun-dkms dvbhdhomerun-utils tvheadend

CMD ["/usr/bin/tvheadend","-C"]