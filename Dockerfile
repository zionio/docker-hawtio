# https://hawt.io
# in a standalone container
#
# docker run --rm -it -p 8080:8080 znio/hawtio
#

FROM alpine:latest

LABEL maintainer="Andrea <andrea@fusilab.net>"

ARG RELEASE=latest
ENV latest="https://api.github.com/repos/hawtio/hawtio/releases/latest"
ENV jdk="openjdk11-jdk"

COPY entrypoint.sh /entrypoint.sh
RUN apk --no-cache add curl jq ${jdk} && \
    chmod 755 /entrypoint.sh && \
    if [[ ${RELEASE} = "latest" ]]; then export RELEASE_NAME=$(curl -s ${latest} | jq -r .name); else export RELEASE_NAME=${RELEASE}; fi && \
    curl --output /hawtio-app.jar https://repo1.maven.org/maven2/io/hawt/hawtio-app/${RELEASE_NAME}/hawtio-app-${RELEASE_NAME}.jar

EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
