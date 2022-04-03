FROM alpine:edge
RUN apk update --no-cache \
    && apk add \
        apache2 \
        php7 \
        php7-apache2 \
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
EXPOSE 80
RUN sed -ri \
        -e 's!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g' \
        -e 's!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g' \
        /etc/apache2/httpd.conf \
    && rm -f /etc/apache2/conf.d/info.conf /etc/apache2/conf.d/userdir.conf
COPY httpd.conf /etc/apache2/conf.d/webtrees.conf
ENV VERSION="2.0.23"
RUN wget -O webtrees.zip "https://github.com/fisharebest/webtrees/releases/download/${VERSION}/webtrees-${VERSION}.zip" \
    && unzip -d /var/lib webtrees.zip \
    && rm -rf webtrees.zip \
    && chown -R apache:apache /var/lib/webtrees/data \
    && true
VOLUME /var/lib/webtrees/data
CMD ["httpd", "-DFOREGROUND"]
