FROM alpine:edge
RUN apk update --no-cache \
    && apk add \
        php7 \
	php7-apcu \
	php7-curl \
	php7-exif \
	php7-fileinfo \
	php7-gd \
	php7-iconv \
	php7-imagick \
	php7-imap \
	php7-intl \
	php7-json \
	php7-mbstring \
	php7-opcache \
	php7-pear \
	php7-pdo \
	php7-pdo_sqlite \
	php7-session \
	php7-simplexml \
	php7-sqlite3 \
	php7-xmlrpc \
	php7-xsl \
	php7-zip \
    && true
ENV VERSION="2.0.16"
RUN wget "https://github.com/fisharebest/webtrees/releases/download/${VERSION}/webtrees-${VERSION}.zip" -O webtrees.zip \
    && unzip webtrees.zip \
    && mv webtrees /var/lib/webtrees
EXPOSE 8000
CMD ["php", "-S", "0.0.0.0:8000", "-t", "/var/lib/webtrees"]
