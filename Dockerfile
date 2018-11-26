FROM nodered/node-red-docker

USER root

RUN apt-get update &&\
    apt-get install -y \
		curl \
		git-core \
        mc \
        vim \
		wget

USER node-red

RUN npm install \
        node-red-dashboard \
        node-red-node-mongodb \
        node-red-contrib-play \
        node-red-contrib-say \
        node-red-contrib-slack \
        node-red-node-feedparser \
        node-red-node-xmpp

COPY setup/ /
