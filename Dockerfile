FROM ubuntu:16.04
RUN apt-get update
RUN apt-get -y install lib32z1 lib32ncurses5 lib32gcc1 openssl libssl-dev
RUN ln -s /lib/x86_64-linux-gnu/libssl.so.1.0.0 /usr/lib/libssl.so && \
    useradd -m worker
RUN mkdir /home/worker/src && \
    mkdir /home/worker/src/output && \
    mkdir /home/worker/src/data && \
    mkdir /home/worker/src/log && \
    chown -R worker:worker /home/worker/src
WORKDIR /home/worker/src/data
USER worker
COPY primusquery /home/worker/