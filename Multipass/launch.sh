#!/bin/sh

git clone https://github.com/Julien-Somasundaram/GraphQL.git ./AWS/MyApp
docker stack deploy -c ./AWS/docker-stack.yml myapp