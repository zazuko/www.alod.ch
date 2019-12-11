FROM node:lts-alpine

RUN npm install -g pm2

RUN mkdir -p /opt/trifid
WORKDIR /opt/trifid
COPY . /opt/trifid
RUN npm ci

ENV HOST 0.0.0.0

USER nobody:nobody

CMD pm2-docker start npm -- start

EXPOSE 8080
