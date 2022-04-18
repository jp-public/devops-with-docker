FROM node:12.16.2 as build-stage
WORKDIR /usr/src/app
COPY . .
RUN npm ci && npm run build


FROM alpine
WORKDIR /usr/src/app 
COPY --from=build-stage /usr/src/app/build/ /usr/src/app/build/
RUN apk add --no-cache npm && npm install -g serve
EXPOSE 3000
CMD ["serve", "-s", "-l", "3000", "build"]