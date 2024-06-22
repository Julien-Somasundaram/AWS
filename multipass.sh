multipass launch --name manager
multipass launch --name worker1
multipass launch --name worker2

multipass exec manager -- docker swarm init
# recuperer le token pour les workers
output=$(multipass exec manager -- docker swarm join-token worker)
join_command=$(echo "$output" | grep "docker swarm join" | sed -e 's/^[[:space:]]*//')
multipass exec worker1 -- $join_command
multipass exec worker2 -- $join_command

multipass exec manager -- git clone https://github.com/Julien-Somasundaram/AWS.git
multipass exec manager -- sh ./AWS/launch.sh