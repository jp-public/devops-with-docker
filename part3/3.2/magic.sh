#!/bin/sh
git clone $1 project

cd project

docker build . -t $3/$2

docker login -u $3 -p $4

docker push $3/$2
