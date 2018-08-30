FROM openjdk:8-jre-alpine

MAINTAINER PlusMinus <piddlpiddl@gmail.com>


# Create directory, and start JD2 for the initial update and creation of config files.
RUN \
    apk add --no-cache --quiet tini su-exec bash && \
	mkdir -p /opt/JDownloader/libs && \
	wget -O /opt/JDownloader/JDownloader.jar --user-agent="https://hub.docker.com/r/plusminus/jdownloader2-headless/" http://installer.jdownloader.org/JDownloader.jar && \
	java -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar && \
	apk add --update ffmpeg

# Beta sevenzipbindings
COPY sevenzip* /opt/JDownloader/

COPY startJD2.sh /opt/JDownloader/
RUN chmod +x /opt/JDownloader/startJD2.sh


ENTRYPOINT ["/sbin/tini", "-g", "--", "/opt/JDownloader/startJD2.sh"]
# Run this when the container is started
CMD ["java", "-Djava.awt.headless=true", "-jar", "/opt/JDownloader/JDownloader.jar"]
