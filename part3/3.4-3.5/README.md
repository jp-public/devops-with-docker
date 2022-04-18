Combined 3.4&3.5 as alpine based image seemed like most logical solution for 3.4 given the starting point (other tweaks reduce image size only by relatively little).

Frontend starting point:
```
FROM node:14
WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run build
RUN npm install -g serve
RUN useradd -m appuser
USER appuser
CMD serve -s -l 5000 build
```
Frontend final:
```
FROM node:14-alpine
WORKDIR /usr/src/app
COPY . .
RUN npm install && npm run build && \
    npm install -g serve && \
    adduser -D appuser
USER appuser
CMD serve -s -l 5000 build
```

Backend stating point:
```
FROM golang:1.16
WORKDIR /usr/src/app
ENV REQUEST_ORIGIN=http://localhost
COPY . .
RUN go build
RUN useradd -m appuser
USER appuser
CMD ./server
```
Backend final:
```
FROM golang:1.16-alpine
WORKDIR /usr/src/app
COPY . .
ENV REQUEST_ORIGIN=http://localhost
RUN go build && adduser -D appuser
USER appuser
CMD ./server
```

Sizes starting point:
frontend 1.19GB
backend 1.07GB

Sizes final:
frontend 346MB
backend 447MB