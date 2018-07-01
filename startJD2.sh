#!/bin/bash

if [ "$GID" ] && [ "$GID" -ne "0" ]
then
	GROUP=jdownloader
	addgroup -g $GID $GROUP
else
	GROUP=root
fi

if [ "$UID" ] && [ "$UID" -ne "0" ]
then
	USER=jdownloader
	adduser -S -D -s /bin/false -u $UID $USER
else
	USER=root
fi

adduser -G $GROUP $USER
chown -R $USER:$GROUP /opt/JDownloader

exec su-exec ${USER}:${GROUP} "$@"

