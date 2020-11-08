FROM alpine:edge
ARG VERSION=3.1.0
WORKDIR /app
RUN wget -O- https://github.com/virt-manager/virt-manager/archive/v${VERSION}.tar.gz | tar xz --strip-components=1
RUN apk add \
        libosinfo \
        openssh-client \
        python3 \
        py3-gobject3 \
        py3-libvirt \
        py3-libxml2 \
        py3-requests
ENTRYPOINT ["/app/virt-install"]
