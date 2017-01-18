FROM node:6.9-onbuild

ENV TRIFID_CONFIG config.swisstopo.json

ADD config.swisstopo.json /usr/src/app/
ADD config.swisstopo.dev.json /usr/src/app/
ADD data /usr/src/app/data

CMD /usr/src/app/node_modules/.bin/trifid --config $TRIFID_CONFIG
EXPOSE 8080
