FROM node:6.9-onbuild

ENV TRIFID_CONFIG config.sai.json

ADD config.sai.json /usr/src/app/
ADD config.sai.dev.bs.json /usr/src/app/
ADD data /usr/src/app/data

CMD /usr/src/app/node_modules/.bin/trifid --config $TRIFID_CONFIG
EXPOSE 8080
