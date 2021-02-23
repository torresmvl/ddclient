FROM alpine:edge as baseImage

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk add --update --no-cache ca-certificates \
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