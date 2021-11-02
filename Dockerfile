FROM ubuntu:latest
COPY ./scripts/install.sh /tmp
RUN /tmp/install.sh
