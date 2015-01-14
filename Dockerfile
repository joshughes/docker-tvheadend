FROM ubuntu-upstart:12.04

EXPOSE 9981

RUN apt-get update && apt-get install -y \
    build-essential \
    hdhomerun-config \
    python-software-properties \
    libavahi-client3 \
    libavahi-common3 \
    liburiparser1 \
    curl

RUN curl http://apt.tvheadend.org/repo.gpg.key | apt-key add -

RUN add-apt-repository ppa:tfylliv/dvbhdhomerun && apt-add-repository http://apt.tvheadend.org/unstable

RUN apt-get update && apt-get install -y dvbhdhomerun-dkms dvbhdhomerun-utils tvheadend

CMD ["/usr/bin/tvheadend","-C"]