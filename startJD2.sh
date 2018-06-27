#!/bin/bash

if [ "$GID" ] && [ "$GID" -ne "0" ]
then
	GROUP=jdownloader
	groupadd -g $GID $GROUP
else
	GROUP=root
fi

if [ "$UID" ] && [ "$UID" -ne "0" ]
then
	USER=jdownloader
	useradd -r -N -s /bin/false -u $UID $USER
else
	USER=root
fi

useradd -G $GROUP $USER
chown -R $USER:$GROUP /opt/JDownloader

exec su-exec "$@"

