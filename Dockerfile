FROM alpine as archive-helper

RUN wget -O linux-bionic.tar.bz2 "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/gentoo-bionic/i686-pc-linux-bionic-20110518.tar.bz2" && tar xvf linux-bionic.tar.bz2

FROM scratch

COPY --from=archive-helper i686-pc-linux-bionic-20110518/ /

RUN touch /etc/passwd
RUN adduser -u 0 -D -h /root root

USER root
WORKDIR /root

ENTRYPOINT /bin/sh
