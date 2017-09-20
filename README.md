# headless-jdownloader2-docker
Headless JDownloader 2 Docker Container

Now it is possible to use a Host Volumes, and this Files are not stored with the root User.
The downloads are submitted with the User who create/run the Docker Container.

## Running the container
0. `sudo su`
1. Create a folder on your host for the configuration files (eg. sudo mkdir ~/config/jd2)
2. run `docker run -d --name jd2 -v ~/config/jd2:/opt/JDownloader/cfg -v /home/user/Downloads:/home/jdownloader/Downloads mrbolle/jdownloader2-headless`
3. stop the container `docker stop jd2`
4. On your host, enter your credentials (in quotes) to the file `org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json` as in `{ "password" : "mypasswort", "email" : "email@home.org" }`
5. Start the container `docker start jd2`
