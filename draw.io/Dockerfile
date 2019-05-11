FROM tomcat:9-jre8-alpine
ARG VERSION=10.0.12
RUN wget "https://github.com/jgraph/drawio/releases/download/v${VERSION}/draw.war" && \
    rm -rf "${CATALINA_HOME}/webapps"/* && \
    mkdir "${CATALINA_HOME}/webapps/ROOT" && \
    unzip draw.war -d "${CATALINA_HOME}/webapps/ROOT"
WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD ["catalina.sh", "run"]
