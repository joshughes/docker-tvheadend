FROM ubuntu:12.04

EXPOSE 9981

RUN apt-get update && apt-get install -y \
    build-essential \
    hdhomerun-config \
    python-software-properties \
    libavahi-client3 \
    libavahi-common3 \
    liburiparser1

COPY package/tvheadend.deb /tmp/tvheadend.deb

RUN add-apt-repository ppa:tfylliv/dvbhdhomerun 

RUN apt-get update && apt-get install -y dvbhdhomerun-dkms dvbhdhomerun-utils

RUN DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/tvheadend.deb && rm /tmp/tvheadend.deb

CMD ["/usr/bin/tvheadend"]