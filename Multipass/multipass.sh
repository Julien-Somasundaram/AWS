#!/bin/bash

# Créer des instances Multipass
multipass launch --name manager -c 2 -m 2G -d 10G
multipass launch --name worker1 -c 2 -m 2G -d 10G
multipass launch --name worker2 -c 2 -m 2G -d 10G

# Installer Docker sur les instances
multipass exec manager -- bash -c "curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh"
multipass exec worker1 -- bash -c "curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh"
multipass exec worker2 -- bash -c "curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh"

# Initialiser Docker Swarm sur le manager
multipass exec manager -- bash -c "docker swarm init"

# Récupérer le jeton pour les workers
output=$(multipass exec manager -- docker swarm join-token worker)
join_command=$(echo "$output" | grep "docker swarm join" | sed -e 's/^[[:space:]]*//')

# Joindre les workers au Swarm
multipass exec worker1 -- bash -c "$join_command"
multipass exec worker2 -- bash -c "$join_command"

# Cloner le dépôt Git et lancer le script
multipass exec manager -- bash -c "git clone https://github.com/Julien-Somasundaram/AWS.git && cd AWS && bash launch.sh"
