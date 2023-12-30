# FROM debian:trixie-slim
FROM debian:latest

ARG DEBCONF_NOWARNINGS="yes"
ARG DEBIAN_FRONTEND noninteractive

COPY ./src /run/
RUN chmod +x /run/*.sh
RUN /run/configure_debian.sh

VOLUME /storage
EXPOSE 22 5900

ENV CPU_CORES "1"
ENV RAM_SIZE "1G"
ENV DISK_SIZE "16G"
ENV BOOT "http://www.example.com/image.iso"

ARG VERSION_ARG="0.0"
RUN echo "$VERSION_ARG" > /run/version

# ENTRYPOINT ["/usr/bin/tini", "-s", "/run/entry.sh"]
ENTRYPOINT ["/bin//bash"]
