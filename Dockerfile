FROM ubuntu:16.04

COPY install.sh install.sh
RUN chmod +x install.sh && sync && ./install.sh && rm install.sh

VOLUME /docker-data
WORKDIR /docker-data

CMD bash
