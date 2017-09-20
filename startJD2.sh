#!/bin/bash

function stopJD2 {
	PID=$(cat JDownloader.pid)
	kill $PID
	wait $PID
	exit
}

if [ "$GID" ]
then
	GROUP=jdownloader
	groupadd -g $GID $GROUP
else
	GROUP=root
fi

if [ "$UID" ] 
then
	USER=jdownloader
	useradd -r -s /bin/false -u $UID -g $GROUP $USER
	chown -R $USER:$GROUP /opt/JDownloader
else
	USER=root
fi

trap stopJD2 EXIT

su -c "java -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar" -s /bin/bash $USER

#java -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar &

#while true; do
#	sleep inf
#done

