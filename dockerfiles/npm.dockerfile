FROM node:lts-iron 

WORKDIR /var/www/html

RUN usermod -u 1000 node && groupmod -g 1000 node 

USER node

ENTRYPOINT [ "npm" ]
