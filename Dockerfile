FROM debian:buster


LABEL org.opencontainers.image.authors="contact@ethersys.fr"
LABEL org.opencontainers.image.source="https://github.com/ethersys/ethersys-docker-duply"
LABEL org.opencontainers.image.description="Official duply image with Docker binaries"

ENV DEBIAN_FRONTEND noninteractive

RUN (apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)

RUN apt-get install -y --no-install-recommends \
    ncftp \
    pwgen \
    duply \
    python-swiftclient \
    sshfs \
    fuse \
    default-mysql-client

ENTRYPOINT ["/usr/bin/duply"]
CMD ["usage"]
