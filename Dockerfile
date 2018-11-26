FROM nodered/node-red-docker:slim-v8

USER root

RUN apk update &&\
    apk add \
        curl \
        g++ \
        gcc \
        git \
        make \
        python \
        wget

COPY setup/ /
RUN chown -R 1001:1001 /data /usr/src/node-red 
USER node-red
