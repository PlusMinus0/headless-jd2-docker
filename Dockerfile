FROM dordoka/rpi-java8

MAINTAINER PlusMinus <piddlpiddl@gmail.com>


# Create directory, downloader JD" and start JD2 for the initial update and creation of config files.
RUN mkdir /opt/JDownloader/ 
RUN wget -O /opt/JDownloader/JDownloader.jar --user-agent="https://hub.docker.com/r/plusminus/jdownloader2-headless/" --progress=bar:force http://installer.jdownloader.org/JDownloader.jar
RUN java -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar


COPY startJD2.sh /opt/JDownloader/
RUN chmod +x /opt/JDownloader/startJD2.sh


# Run this when the container is started
CMD /opt/JDownloader/startJD2.sh
