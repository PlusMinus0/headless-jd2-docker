#!/bin/bash

function stopJD2 {
	PID=$(cat JDownloader.pid)
	kill $PID
	wait $PID
	exit
}

trap stopJD2 EXIT

# Add a user to run the jdownloader
addgroup --gid $GID jdusers
useradd -M --uid $UID --gid $GID jduser

su jduser -c 'java -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar &'

while true; do
	sleep inf
done

