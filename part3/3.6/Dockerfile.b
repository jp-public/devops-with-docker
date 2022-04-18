FROM golang:1.16-alpine as build-stage

WORKDIR /src/app

COPY . .

RUN CGO_ENABLED=0 go build 


FROM scratch

WORKDIR /src/app

ENV REQUEST_ORIGIN=http://localhost

COPY --from=build-stage /src/app /src/app

ENTRYPOINT ["./server"]