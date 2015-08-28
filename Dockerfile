FROM java:jre

MAINTAINER PlusMinus <piddlpiddl@gmail.com>


# Create directory, downloader JD" and start JD2 for the initial update and creation of config files.
RUN \
	mkdir /opt/JDownloader/ && \
	wget -O /opt/JDownloader/JDownloader.jar --user-agent="https://hub.docker.com/r/plusminus/jdownloader2-headless/" --progress=bar:force http://installer.jdownloader.org/JDownloader.jar && \
	java -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar


ADD start.sh /opt/JDownloader/
RUN chmod +x /opt/JDownloader/start.sh


# Run this when the container is started
CMD /opt/JDownloader/startJD2.sh
