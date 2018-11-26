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
        node-red-contrib-slack \
        node-red-dashboard \
        node-red-node-mongodb \
        node-red-node-feedparser \
        node-red-node-xmpp

COPY setup/ /

#COPY data/package.json /data/package.json
#COPY data/settings.js /data/settings.js
