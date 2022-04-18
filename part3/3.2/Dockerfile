FROM docker:20.10.14-git

WORKDIR /script

COPY magic.sh .

RUN chmod +x magic.sh

ENTRYPOINT ["./magic.sh"]