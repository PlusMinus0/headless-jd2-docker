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

# Sometimes this gets deleted. Just copy it every time.
cp /opt/JDownloader/sevenzip* /opt/JDownloader/libs/

su-exec ${USER}:${GROUP} "$@"

# Keep container alive when jd2 restarts
while sleep 3600; do :; done
