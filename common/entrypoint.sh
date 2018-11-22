#!/bin/sh

# Set defaults for uid and gid to not be root
if [ -z $GID ]; then GID=100;  fi
if [ -z $UID ]; then UID=1000; fi

if [ "$GID" -ne "0" ]; then
	GROUP=jdownloader
	groupadd -g $GID $GROUP
else
	GROUP=root
fi

if [ "$UID" -ne "0" ]; then
    USER=jdownloader

    # Create user without home (-M) and remove login shell
    useradd -M -s /bin/false -g $GID -u $UID $USER
else
    USER=root
    usermod -ag $GID
fi

chown -R $UID:$GID /opt/JDownloader

# Sometimes this gets deleted. Just copy it every time.
cp /opt/JDownloader/sevenzip* /opt/JDownloader/libs/

su-exec ${UID}:${GID} "$@"

# Keep container alive when jd2 restarts
while sleep 3600; do :; done
