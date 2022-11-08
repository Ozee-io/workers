ARG alpine_version=latest

FROM alpine:${alpine_version}

ARG install_script="terraform.sh"
ARG minor_version="1.1"

RUN apk -U upgrade && apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    git \
    jq \
    openssh \
    openssh-keygen \
    tzdata

RUN adduser --disabled-password --uid=2123 ozee
WORKDIR /worker

COPY ./scripts/${install_script} /worker/script.sh

RUN chmod +x script.sh && ./script.sh ${minor_version} && rm -rf ./script.sh

USER ozee