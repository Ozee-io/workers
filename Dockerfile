ARG alpine_version=latest
ARG install_script
ARG minor_version

FROM alpine:${alpine_version}

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

COPY ./scripts/${install_script} ./script.sh

RUN chmod 777 script.sh && ./script.sh ${minor_version} && rm -rf ./script.sh
WORKDIR /worker

USER ozee