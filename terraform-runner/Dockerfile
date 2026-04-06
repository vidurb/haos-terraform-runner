FROM ghcr.io/home-assistant/base:latest

ARG BUILD_ARCH
ARG TFC_AGENT_VERSION=1.28.6

RUN set -eux; \
    case "${BUILD_ARCH}" in \
      amd64)   GOARCH=amd64 ;; \
      aarch64) GOARCH=arm64 ;; \
      *)       echo "unsupported arch: ${BUILD_ARCH}" >&2; exit 1 ;; \
    esac; \
    apk add --no-cache curl unzip; \
    curl -fsSL "https://releases.hashicorp.com/tfc-agent/${TFC_AGENT_VERSION}/tfc-agent_${TFC_AGENT_VERSION}_linux_${GOARCH}.zip" \
      -o /tmp/tfc-agent.zip; \
    unzip /tmp/tfc-agent.zip -d /usr/local/bin/; \
    rm /tmp/tfc-agent.zip; \
    chmod +x /usr/local/bin/tfc-agent*; \
    apk del curl unzip

COPY run.sh /
RUN chmod a+x /run.sh

WORKDIR /data

CMD [ "/run.sh" ]
