# headless-jd2-docker
Headless JDownloader 2 Docker Container

## Running the container
0. `sudo su`
1. Create a folder on your host for the configuration files (eg. sudo mkdir /config/jd2)
2. run `docker run -d --name jd2 -v /config/jd2:/opt/JDownloader/cfg -v /home/user/Downloads:/root/Downloads plusminus/jdownloader2-headless`
3. stop the container `docker stop jd2`
4. On your host, edit the file `org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json` to match the content below
5. Start the container

`{
  "uniquedeviceidsaltv2" : "i don't know whats supposed to be in here",
  "autoconnectenabledv2" : true,
  "debugenabled" : false,
  "lastupnpport" : 0,
  "lastlocalport" : 58103,
  "connectip" : "api.jdownloader.org",
  "latesterror" : "NONE",
  "manuallocalport" : 3129,
  "password" : "mypasswort",
  "clientconnectport" : 80,
  "directconnectmode" : "LAN",
  "devicename" : "JDownloader@docker",
  "manualremoteport" : 3129,
  "uniquedeviceidv2" : "same as above",
  "email" : "email@home.org"
}`


