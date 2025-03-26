FROM alpine:edge AS builder
ENV VERSION="2.2.1"
RUN wget -O- "https://github.com/fisharebest/webtrees/releases/download/${VERSION}/webtrees-${VERSION}.zip" | unzip -d /var/lib -
RUN mkdir -p /var/lib/webtrees/modules_v4/webtrees_simpleautologin
RUN wget -O- "https://github.com/fanningert/webtrees_simpleautologin/archive/refs/tags/0.0.6.tar.gz" | tar xz --strip-components=1 --directory=/var/lib/webtrees/modules_v4/webtrees_simpleautologin

FROM dunglas/frankenphp:php8.4-alpine
RUN install-php-extensions gd intl zip
COPY --from=builder /var/lib/webtrees/ /app/
EXPOSE 80
ENV SERVER_NAME="http://"
VOLUME /app/data
