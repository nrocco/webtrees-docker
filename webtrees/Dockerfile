FROM alpine:edge
RUN apk update --no-cache \
    && apk add \
        apache2 \
        php8 \
        php8-apache2 \
        php8-apcu \
        php8-curl \
        php8-exif \
        php8-fileinfo \
        php8-gd \
        php8-iconv \
        php8-imap \
        php8-intl \
        php8-json \
        php8-mbstring \
        php8-opcache \
        php8-pdo \
        php8-pdo_sqlite \
        php8-pear \
        php8-pecl-imagick \
        php8-session \
        php8-simplexml \
        php8-sqlite3 \
        php8-xsl \
        php8-zip \
    && true
EXPOSE 80
RUN sed -ri \
        -e 's!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g' \
        -e 's!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g' \
        /etc/apache2/httpd.conf \
    && rm -f /etc/apache2/conf.d/info.conf /etc/apache2/conf.d/userdir.conf
COPY httpd.conf /etc/apache2/conf.d/webtrees.conf
ENV VERSION="2.1.7"
RUN wget -O webtrees.zip "https://github.com/fisharebest/webtrees/releases/download/${VERSION}/webtrees-${VERSION}.zip" \
    && unzip -d /var/lib webtrees.zip \
    && rm -rf webtrees.zip \
    && chown -R apache:apache /var/lib/webtrees/data \
    && true
VOLUME /var/lib/webtrees/data
CMD ["httpd", "-DFOREGROUND"]
