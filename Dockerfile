FROM ubuntu:12.04

EXPOSE 9981

RUN apt-get update && apt-get install -y \
    build-essential \
    checkinstall \
    git \
    libssl-dev \
    libavcodec-dev \
    gzip \
    clisp-module-zlib \
    liburiparser-dev \
    libavahi-client-dev \
    libavutil-dev \
    libavcodec-dev \
    pkg-config \
    hdhomerun-config \
    python-software-properties \
    ffmpeg

RUN add-apt-repository ppa:tfylliv/dvbhdhomerun 

RUN apt-get update && apt-get install -y dvbhdhomerun-dkms dvbhdhomerun-utils


# RUN git clone https://github.com/h0tw1r3/dvbhdhomerun /dvbhdhomerun && \
#     cd dvbhdhomerun && dpkg-buildpackage -b && cd .. && dpkg -i *.deb

RUN git clone https://github.com/tvheadend/tvheadend.git /tvheadend

RUN cd /tvheadend && ./configure

RUN cd /tvheadend && make

CMD ["/bin/bash"]