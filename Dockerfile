FROM alpine:3.13 as baseImage

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk --update add --no-cache ca-certificates \
    ddclient \
    drill \
    curl \
    tini

COPY --chown=ddclient:ddclient ./config /etc/ddclient
WORKDIR /etc/ddclient
RUN chmod -x ./ddclient.conf && \
    chown ddclient:ddclient /etc/ddclient

USER ddclient
ENTRYPOINT [ "/sbin/tini", "--", "ddclient" ]