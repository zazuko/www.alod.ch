FROM node:6.9-onbuild

RUN npm install pm2 -g

ENV TRIFID_CONFIG config.sai.json

ADD config.sai.json /usr/src/app/
ADD config.sai.dev.bs.json /usr/src/app/
ADD data /usr/src/app/data

CMD ["pm2-docker", "pm2-config.yml"]
EXPOSE 8080
