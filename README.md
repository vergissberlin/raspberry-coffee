# coffee-bin

>  Holds flows for raspberry coffee bin counter with NodeRED.

[![NSP Status](https://nodesecurity.io/orgs/programmerq/projects/adb455c0-39c6-45b8-ad2c-8831d66dc366/badge)](https://nodesecurity.io/orgs/programmerq/projects/adb455c0-39c6-45b8-ad2c-8831d66dc366)

## Installation
### Local development

1. Create an docker network ``docker network create webproxy``
2. Rename the docker-compose file ``cp docker-compose.development.yml docker-compose-override.yml``
3. Start the application ``docker-compose up -d``

## Server

1. Start your httpd proxy
2. Start the application ``docker-compose up -d``


## Usage
### Deployment with git

If you wanna use git to save your flows, you have to install _git_ and create a _key_

1.  ``sudo apt update && apt install git-core``
2.  Gennerate ssh key ``ssh-keygen`` (hit _enter_ twice) and add the generated key to your deployment key list on your repository server ``cat .ssh/id_rsa.pub``
3.  Configure _git_
    -   ``git config --global push.default matching``
    -   ``git config --global user.name "Coffee"``
    -   ``git config --global user.email sammy@example.com``
4.  ``git clone YOUR-REPO.git ~/flows``

#### Environment variables

1.  Authentification
    -   ADMIN_USERNAME
    -   ADMIN_PASSWORD
2.  Deployment
    -   GIT_EMAIL
    -   GIT_NAME
    -   GIT_REPOSITORY
3.  Monitoring
    -   PM2_SECRET_KEY
    -   PM2_PUBLIC_KEY

#### Password generation

``node-red-admin hash-pw``
