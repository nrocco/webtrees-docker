FROM dunglas/frankenphp:latest-alpine
RUN install-php-extensions gd intl zip
ENV VERSION="2.2.1"
RUN <<EOF
wget -O- "https://github.com/fisharebest/webtrees/releases/download/${VERSION}/webtrees-${VERSION}.zip" | unzip -d /tmp -
rm -rf /app
mv /tmp/webtrees /app
EOF
RUN <<EOF
wget "https://github.com/magicsunday/webtrees-fan-chart/releases/download/3.0.0/webtrees-fan-chart.zip"
unzip -d /app/modules_v4 webtrees-fan-chart.zip
rm -f webtrees-fan-chart.zip
wget "https://github.com/ekdahl/webtrees-primer-theme/releases/download/1.3.1/webtrees-primer-theme-1.3.1.zip"
unzip -d /app/modules_v4 webtrees-primer-theme-1.3.1.zip
rm -f webtrees-primer-theme-1.3.1.zip
wget "https://github.com/fanningert/webtrees_simpleautologin/archive/refs/tags/0.0.6.zip"
unzip -d /app/modules_v4 0.0.6.zip
rm -f 0.0.6.zip
mv /app/modules_v4/webtrees_simpleautologin-0.0.6 /app/modules_v4/webtrees_simpleautologin
EOF
RUN chown -R www-data:www-data /app/data
EXPOSE 80
ENV SERVER_NAME="http://"
VOLUME /app/data
