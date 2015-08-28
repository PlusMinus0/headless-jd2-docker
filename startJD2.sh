#!/bin/bash

function stopJD2 {
	PID=$(cat JDownloader.pid)
	kill $PID
	wait $PID
	exit
}

trap stopJD2 EXIT

java -Djava.awt.headless=true -jar JDownloader.jar

while true; do
	sleep inf
done

