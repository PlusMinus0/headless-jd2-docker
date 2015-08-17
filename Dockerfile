FROM java:jre

MAINTAINER PlusMinus <piddlpiddl@gmail.com>


# Create directory, downloader JD" and start JD2 for the initial update and creation of config files.
RUN \
	mkdir /opt/JDownloader/ && \
	wget -O /opt/JDownloader/JDownloader.jar --progress=bar:force http://installer.jdownloader.org/JDownloader.jar && \
	java -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar


# Run this when the container is started
CMD java -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar
