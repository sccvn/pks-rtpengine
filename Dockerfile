FROM debian:bookworm-slim

LABEL maintainer="Mathias WOLFF <mathias@celea.org> (https://www.pyfreebilling.com/)"

ENV REFRESHED_AT 2024-01-10
ENV VERSION 1.0.1

ENV DEBIAN_FRONTEND noninteractive

ENV DIST="bookworm"
ENV REL="12.1" 

RUN apt update -y && apt install wget curl iproute2 -y
RUN wget https://rtpengine.dfx.at/latest/pool/main/r/rtpengine-dfx-repo-keyring/rtpengine-dfx-repo-keyring_1.0_all.deb && \
    dpkg -i rtpengine-dfx-repo-keyring_1.0_all.deb

RUN echo "deb [signed-by=/usr/share/keyrings/dfx.at-rtpengine-archive-keyring.gpg] https://rtpengine.dfx.at/$REL $DIST main" | tee /etc/apt/sources.list.d/dfx.at-rtpengine.list

RUN apt update -y && apt install rtpengine -y

VOLUME ["/tmp"]
COPY ./entrypoint.sh /entrypoint.sh
COPY ./rtpengine.conf /etc
ENTRYPOINT ["/entrypoint.sh"]
CMD ["rtpengine"]

HEALTHCHECK CMD curl --fail http://localhost:8080/ping || exit 1
