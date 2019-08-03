FROM openjdk:8-jre-alpine

MAINTAINER PlusMinus <piddlpiddl@gmail.com>

# Create directory, and start JD2 for the initial update and creation of config files.
RUN apk update && apk upgrade && \
    apk add --no-cache --quiet tini su-exec shadow ffmpeg jq && \
    mkdir -p /opt/JDownloader/libs && \
    wget -O /opt/JDownloader/JDownloader.jar --user-agent="https://hub.docker.com/r/plusminus/jdownloader2-headless/" http://installer.jdownloader.org/JDownloader.jar && \
    java -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar

# Beta sevenzipbindings and entrypoint
COPY common/* /opt/JDownloader/
RUN chmod +x /opt/JDownloader/entrypoint.sh


ENTRYPOINT ["tini", "-g", "--", "/opt/JDownloader/entrypoint.sh"]
# Run this when the container is started
CMD ["java", "-Djava.awt.headless=true", "-jar", "/opt/JDownloader/JDownloader.jar"]
