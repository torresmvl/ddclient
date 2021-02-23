FROM alpine:edge as baseImage

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk add --update --no-cache ca-certificates \
    ddclient \
    curl \
    tini

COPY --chown=ddclient:ddclient ./config/ddclient.conf /etc/ddclient/ddclient.conf
WORKDIR /etc/ddclient
RUN chmod 0600 ./ddclient.conf

ENTRYPOINT [ "/sbin/tini", "--", "ddclient" ]