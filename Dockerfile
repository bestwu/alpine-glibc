FROM alpine:3.5
MAINTAINER Peter Wu <piterwu@outlook.com>
ENV LANG=C.UTF-8 \
    GLIBC_PKG_VERSION=2.25-r0
WORKDIR /tmp
RUN apk add --no-cache --update-cache curl ca-certificates && \
  curl -Lo /etc/apk/keys/sgerrand.rsa.pub "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/sgerrand.rsa.pub" && \
  curl -Lo glibc-${GLIBC_PKG_VERSION}.apk "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/glibc-${GLIBC_PKG_VERSION}.apk" && \
  apk add glibc-${GLIBC_PKG_VERSION}.apk&& \
  apk del curl ca-certificates && \
  rm -rf /tmp/* /var/cache/apk/*