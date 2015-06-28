# docker-teamfortress2
Team Fortress 2 Docker container

uses LGSM to build and run:
https://github.com/dgibbs64/linuxgsm/wiki/Install#Team-Fortress-2
old instructions here (contains more info)
http://danielgibbs.co.uk/lgsm/tf2server/

simply `make run` you will be prompted for your username and password
you will need to set the STEAM_ USERNAME and PASSWORD variables in your derivative Dockerfile
https://wiki.teamfortress.com/wiki/Linux_dedicated_server

alternatively copy steamer.tpl to steamer.txt and edit as you like

main website:
http://thalhalla.github.io/docker-teamfortress2/
