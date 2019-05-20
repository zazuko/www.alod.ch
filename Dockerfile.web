FROM node:12

RUN npm install -g pm2

RUN mkdir -p /opt/trifid
WORKDIR /opt/trifid
COPY . /opt/trifid
RUN npm ci

CMD pm2-docker start npm -- start

EXPOSE 8080
