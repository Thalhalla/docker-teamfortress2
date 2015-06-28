FROM joshuacox/steamer
MAINTAINER Josh Cox <josh 'at' webhosting coop>

USER root
ENV DOCKER_TF2 20150513

# override these variables in your Dockerfile
ENV STEAM_USERNAME anonymous
ENV STEAM_PASSWORD ' '
ENV STEAM_GUARD_CODE ' '
# and override this file with the command to start your server
USER root
ADD ./run.sh /run.sh
RUN chmod 755 /run.sh
# Override the default start.sh
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

USER steam

WORKDIR /home/steam
RUN wget http://gameservermanagers.com/dl/tf2server
RUN chmod +x tf2server

ENTRYPOINT ["/start.sh"]
