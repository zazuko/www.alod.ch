# First step
FROM node:lts AS builder

WORKDIR /src
ADD package.json package-lock.json ./
RUN npm ci

# Second step
FROM node:lts-alpine

RUN npm install -g pm2

RUN mkdir -p /opt/trifid
WORKDIR /opt/trifid
COPY --from=builder /src/node_modules/ ./node_modules
ADD . /opt/trifid

ENV HOST 0.0.0.0

USER nobody:nobody

CMD pm2-docker start npm -- start

EXPOSE 8080
