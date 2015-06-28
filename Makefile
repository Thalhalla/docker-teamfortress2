all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""  This is merely a base image for usage read the README file
	@echo ""   1. make run       - build and run docker container

build: builddocker beep

run: steam_username steam_password steam_guard_code steam_dir builddocker rundocker beep

rundocker:
	@docker run --name=`cat NAME` \
	--cidfile="cid" \
	-v /tmp:/tmp \
	-v `cat steam_dir`:/home/steam \
	-p 27005:27005/udp \
	-p 27015:27015/udp \
	-p 27020:27020/udp \
	--env STEAM_USERNAME=`cat steam_username` \
	--env STEAM_PASSWORD=`cat steam_password` \
	-v /var/run/docker.sock:/run/docker.sock \
	-v $(shell which docker):/bin/docker \
	-t `cat TAG`

builddocker:
	/usr/bin/time -v docker build -t `cat TAG` .

beep:
	@echo "beep"
	@aplay /usr/share/sounds/alsa/Front_Center.wav

kill:
	@docker kill `cat cid`

rm-steamer:
	rm  steamer.txt

rm-image:
	@docker rm `cat cid`
	@rm cid

cleanfiles:
	rm steam_username
	rm steam_password

rm: kill rm-image

clean: cleanfiles rm

enter:
	docker exec -i -t `cat cid` /bin/bash

steam_username:
	@while [ -z "$$STEAM_USERNAME" ]; do \
		read -r -p "Enter the steam username you wish to associate with this container [STEAM_USERNAME]: " STEAM_USERNAME; echo "$$STEAM_USERNAME">>steam_username; cat steam_username; \
	done ;

steam_guard_code:
	@while [ -z "$$STEAM_GUARD_CODE" ]; do \
		read -r -p "Enter the steam guard code you wish to associate with this container [STEAM_GUARD_CODE]: " STEAM_GUARD_CODE; echo "$$STEAM_GUARD_CODE">>steam_guard_code; cat steam_guard_code; \
	done ;

steam_password:
	@while [ -z "$$STEAM_PASSWORD" ]; do \
		read -r -p "Enter the steam password you wish to associate with this container [STEAM_PASSWORD]: " STEAM_PASSWORD; echo "$$STEAM_PASSWORD">>steam_password; cat steam_password; \
	done ;

steam_dir:
	@while [ -z "$$STEAM_DIR" ]; do \
		read -r -p "Enter the steam dir you wish to associate with this container [STEAM_DIR]: " STEAM_DIR; echo "$$STEAM_DIR">>steam_dir; cat steam_dir; \
	done ;
