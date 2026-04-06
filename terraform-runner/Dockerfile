ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM hashicorp/tfc-agent:latest AS tfc
FROM $BUILD_FROM

COPY --from=tfc /home/tfc-agent/bin/ /usr/local/bin/

COPY run.sh /
RUN chmod a+x /run.sh

WORKDIR /data

CMD [ "/run.sh" ]
