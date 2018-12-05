[![Build Status](https://travis-ci.com/PlusMinus0/headless-jd2-docker.svg?branch=master)](https://travis-ci.com/PlusMinus0/headless-jd2-docker)
# Supported tags
 * [`latest`, `debian`, `v3.0-debian` (debian.Dockerfile)](https://github.com/PlusMinus0/headless-jd2-docker/blob/master/debian.Dockerfile)
 * [`alpine`, `v3.0-alpine` (alpine.Dockerfile)](https://github.com/PlusMinus0/headless-jd2-docker/blob/master/alpine.Dockerfile)
 * [`dev-debian` (debian.Dockerfile)](https://github.com/PlusMinus0/headless-jd2-docker/blob/dev/debian.Dockerfile)
 * [`dev-alpine` (alpine.Dockerfile)](https://github.com/PlusMinus0/headless-jd2-docker/blob/dev/alpine.Dockerfile)
 * [`v2.1` (Dockerfile)](https://github.com/PlusMinus0/headless-jd2-docker/blob/v2.1/Dockerfile)
 * [`v2.0` (Dockerfile)](https://github.com/PlusMinus0/headless-jd2-docker/blob/v2.0/Dockerfile)


# Running the container
0.  Become root if your user is not part of the docker group:

    ```
    sudo su
    ```
1.  Create a folder on your host for the configuration files (eg. sudo mkdir /config/jd2)
2.  Run the container:

    ```
    docker run -d --name jd2 \
        -v /config/jd2:/opt/JDownloader/cfg \
        -v /home/user/Downloads:/downloads \
        plusminus/jdownloader2-headless
    ```
3.  Wait a minute for the container to initialize
4.  Stop the container:

    ```
    docker stop jd2
    ```
5.  On your host, enter your credentials (in quotes) to the file `org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json` as in:

    ```
    { "email" : "email@home.org", "password" : "mypasswort" }
    ```
6.  Start the container:

    ```
    docker start jd2
    ```
    
# Optional environment variables
|Environment Variable|Description|
|--------------------|-----------|
|UID|Specifies the UID the daemon should run as. All created files will be owned by this UID. Defaults to 1000.|
|GID|Specifies the GID for all created files. This only works in combination with the UID. Defaults to 100 for users.|

Not setting these will default to 1000:100.
