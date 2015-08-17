FROM java:jre

MAINTAINER PlusMinus <piddlpiddl@gmail.com>


RUN \
	mkdir /opt/JDownloader/ && \
	wget -O /opt/JDownloader/JDownloader.jar --progress=bar:force http://installer.jdownloader.org/JDownloader.jar && \
	java -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar

CMD java -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar
