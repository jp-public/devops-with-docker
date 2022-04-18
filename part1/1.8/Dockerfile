FROM ubuntu:20.04
RUN apt-get update && apt-get install -y curl
WORKDIR /usr/src/app
COPY curl.sh .
RUN chmod +x curl.sh
ENTRYPOINT [ "./curl.sh" ]