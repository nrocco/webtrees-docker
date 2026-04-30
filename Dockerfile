FROM alpine:edge
RUN apk update --no-cache \
    && apk add \
        apache2 \
        php85 \
        php85-apache2 \
        php85-curl \
        php85-exif \
        php85-fileinfo \
        php85-gd \
        php85-iconv \
        php85-imap \
        php85-intl \
        php85-mbstring \
        php85-pdo \
        php85-pdo_sqlite \
        php85-pear \
        php85-pecl-apcu \
        php85-pecl-imagick \
        php85-session \
        php85-simplexml \
        php85-sqlite3 \
        php85-xsl \
        php85-zip \
        unzip \
        wget \
    && true
EXPOSE 80
RUN sed -ri \
        -e 's!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g' \
        -e 's!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g' \
        /etc/apache2/httpd.conf \
    && rm -f /etc/apache2/conf.d/info.conf /etc/apache2/conf.d/userdir.conf
COPY httpd.conf /etc/apache2/conf.d/webtrees.conf
RUN wget "https://github.com/fisharebest/webtrees/releases/download/2.2.6/webtrees-2.2.6.zip" && unzip -d /var/lib webtrees-2.2.6.zip && rm -f webtrees-2.2.6.zip
RUN wget "https://github.com/Jefferson49/webtrees-oauth2-client/releases/download/v1.1.11/oauth2_client_v1.1.11.zip" && unzip -d /var/lib/webtrees/modules_v4 oauth2_client_v1.1.11.zip && rm -f oauth2_client_v1.1.11.zip
RUN wget "https://github.com/ekdahl/webtrees-primer-theme/releases/download/1.3.2/webtrees-primer-theme-1.3.2.zip" && unzip -d /var/lib/webtrees/modules_v4 webtrees-primer-theme-1.3.2.zip && rm -f webtrees-primer-theme-1.3.2.zip
RUN wget "https://github.com/magicsunday/webtrees-fan-chart/releases/download/3.3.6/webtrees-fan-chart.zip" && unzip -d /var/lib/webtrees/modules_v4 webtrees-fan-chart.zip && rm -f webtrees-fan-chart.zip
RUN chown -R apache:apache /var/lib/webtrees/data
VOLUME /var/lib/webtrees/data
CMD ["httpd", "-DFOREGROUND"]
