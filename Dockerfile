FROM node:6-onbuild

RUN npm install pm2 -g

ENV TRIFID_CONFIG config.alod.json

ADD config.alod.json /usr/src/app/
ADD config.alod.dev.bs.json /usr/src/app/
ADD data /usr/src/app/data

CMD ["pm2-docker", "pm2-config.yml"]
EXPOSE 8080
