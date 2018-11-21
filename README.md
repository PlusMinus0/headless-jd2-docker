## Supported tags
 * [latest, debian, v3-debian](https://github.com/PlusMinus0/headless-jd2-docker/blob/master/debian.Dockerfile)
 * [alpine, v3-alpine](https://github.com/PlusMinus0/headless-jd2-docker/blob/master/alpine.Dockerfile)
 * [![](https://images.microbadger.com/badges/version/plusminus/jdownloader2-headless:dev-debian.svg)](https://microbadger.com/images/plusminus/jdownloader2-headless:dev-debian "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/plusminus/jdownloader2-headless:dev-debian.svg)](https://microbadger.com/images/plusminus/jdownloader2-headless:dev-debian "Get your own image badge on microbadger.com")[dev-debian](https://github.com/PlusMinus0/headless-jd2-docker/blob/dev/debian.Dockerfile)
 * [![](https://images.microbadger.com/badges/version/plusminus/jdownloader2-headless:dev-alpine.svg)](https://microbadger.com/images/plusminus/jdownloader2-headless:dev-alpine "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/plusminus/jdownloader2-headless:dev-alpine.svg)](https://microbadger.com/images/plusminus/jdownloader2-headless:dev-alpine "Get your own image badge on microbadger.com")[dev-alpine](https://github.com/PlusMinus0/headless-jd2-docker/blob/dev/alpine.Dockerfile)
 * [![](https://images.microbadger.com/badges/version/plusminus/jdownloader2-headless:v2.1.svg)](https://microbadger.com/images/plusminus/jdownloader2-headless:v2.1 "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/plusminus/jdownloader2-headless:v2.1.svg)](https://microbadger.com/images/plusminus/jdownloader2-headless:v2.1 "Get your own image badge on microbadger.com")[v2.1](https://github.com/PlusMinus0/headless-jd2-docker/blob/v2.1/Dockerfile)
 * [v2.0](https://github.com/PlusMinus0/headless-jd2-docker/blob/v2.0/Dockerfile)


## Running the container
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
    
## Optional environment variables
|Environment Variable|Description|
|--------------------|-----------|
|UID|Specifies the UID the daemon should run as. All created files will be owned by this UID. Defaults to 1000.|
|GID|Specifies the GID for all created files. This only works in combination with the UID. Defaults to 100 for users.|

Not setting these will default to 1000:100.
