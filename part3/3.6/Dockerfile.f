FROM node:14-alpine as build-stage

WORKDIR /usr/src/app

COPY . .

RUN npm install && npm run build

FROM alpine

WORKDIR /usr/src/app 

COPY --from=build-stage /usr/src/app/build/ /usr/src/app/build/

RUN apk add --no-cache npm && npm install -g serve && adduser -D appuser

USER appuser

CMD serve -s -l 5000 build