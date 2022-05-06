FROM golang:alpine AS builder
RUN apk add git
RUN /usr/local/go/bin/go get blitiri.com.ar/go/dnss
FROM scratch AS bin
COPY --from=builder /go/bin/dnss ./
