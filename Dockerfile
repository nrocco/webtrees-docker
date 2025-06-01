FROM alpine:edge
RUN apk update --no-cache \
    && apk add \
        apache2 \
        php83 \
        php83-apache2 \
        php83-curl \
        php83-exif \
        php83-fileinfo \
        php83-gd \
        php83-iconv \
        php83-imap \
        php83-intl \
        php83-mbstring \
        php83-opcache \
        php83-pdo \
        php83-pdo_sqlite \
        php83-pear \
        php83-pecl-apcu \
        php83-pecl-imagick \
        php83-session \
        php83-simplexml \
        php83-sqlite3 \
        php83-xsl \
        php83-zip \
    && true
EXPOSE 80
RUN sed -ri \
        -e 's!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g' \
        -e 's!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g' \
        /etc/apache2/httpd.conf \
    && rm -f /etc/apache2/conf.d/info.conf /etc/apache2/conf.d/userdir.conf
COPY httpd.conf /etc/apache2/conf.d/webtrees.conf
ENV VERSION="2.2.1"
RUN wget -O- "https://github.com/fisharebest/webtrees/releases/download/${VERSION}/webtrees-${VERSION}.zip" | unzip -d /var/lib -
RUN <<EOF
wget "https://github.com/magicsunday/webtrees-fan-chart/releases/download/3.0.0/webtrees-fan-chart.zip"
unzip -d /var/lib/webtrees/modules_v4 webtrees-fan-chart.zip
rm -f webtrees-fan-chart.zip
wget "https://github.com/ekdahl/webtrees-primer-theme/releases/download/1.3.1/webtrees-primer-theme-1.3.1.zip"
unzip -d /var/lib/webtrees/modules_v4 webtrees-primer-theme-1.3.1.zip
rm -f webtrees-primer-theme-1.3.1.zip
wget "https://github.com/fanningert/webtrees_simpleautologin/archive/refs/tags/0.0.6.zip"
unzip -d /var/lib/webtrees/modules_v4 0.0.6.zip
rm -f 0.0.6.zip
mv /var/lib/webtrees/modules_v4/webtrees_simpleautologin-0.0.6 /var/lib/webtrees/modules_v4/webtrees_simpleautologin
EOF
RUN chown -R apache:apache /var/lib/webtrees/data
VOLUME /var/lib/webtrees/data
CMD ["httpd", "-DFOREGROUND"]
