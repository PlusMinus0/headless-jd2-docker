# headless-jd2-docker
Headless JDownloader 2 Docker Container

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
|UID|Specifies the UID the daemon should run as. All created files will be owned by this UID. Defaults to 0 for root.|
|GID|Specifies the GID for all created files. This only works in combination with the UID. Defaults to 0 for root.|

Not setting these will default to root:root. If you are required to set all environment varibles, setting these to 0 will fall back to the default.
