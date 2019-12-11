# First step
FROM node:lts AS builder

WORKDIR /src
ADD package.json package-lock.json ./
RUN npm ci

# Second step
FROM node:lts-alpine

RUN mkdir -p /app
WORKDIR /app
COPY --from=builder /src/node_modules/ ./node_modules
ADD . /app

ENV HOST 0.0.0.0
USER nobody:nobody

ENTRYPOINT []

# Using npm scripts for running the app allows two things:
#  - Handle signals correctly (Node does not like to be PID1)
#  - Let Skaffold detect it's a node app so it can attach the Node debugger
CMD ["npm", "run", "start"]

EXPOSE 8080
HEALTHCHECK CMD wget -q -O- http://localhost:8080/health
