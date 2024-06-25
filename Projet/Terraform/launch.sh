#!/bin/sh

# Charger les variables depuis le fichier .env
# export $(grep -v '^#' .env | xargs)


AWS_ACCESS_KEY_ID=""
AWS_SECRET_ACCESS_KEY=""


# Répertoire de travail
WORKSPACE_DIR=${PWD}



# Créer un conteneur Docker pour Terraform
docker build -t terraform-container .

# Fonction pour exécuter une commande Terraform dans un conteneur Docker
docker run --rm -it \
  -v ${HOME}/.aws:/root/.aws \
  -v ${HOME}/.ssh:/root/.ssh \
  -v ${PWD}:/workspace \
  -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
  -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  terraform-container init
 
  
# Exécuter Terraform plan
docker run --rm -it \
  -v ${HOME}/.aws:/root/.aws \
  -v ${HOME}/.ssh:/root/.ssh \
  -v ${PWD}:/workspace \
  -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
  -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  terraform-container plan

# Exécuter Terraform apply avec auto-approve
docker run --rm -it \
  -v ${HOME}/.aws:/root/.aws \
  -v ${HOME}/.ssh:/root/.ssh \
  -v ${PWD}:/workspace \
  -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
  -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  terraform-container apply -auto-approve

# Extraire les adresses IP des instances
instance_ips=$(docker run --rm -it \
  -v ${HOME}/.aws:/root/.aws \
  -v ${HOME}/.ssh:/root/.ssh \
  -v ${PWD}:/workspace \
  -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
  -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  terraform-container output -json instance_ips) 

# Afficher les adresses IP des instances
echo "Adresses IP des instances : $instance_ips"

# Optionnel : enregistrer les adresses IP dans un fichier
echo $instance_ips > instance_ips.txt

# Supprimer les crochets et les guillemets
instance_ips=$(echo "$instance_ips" | tr -d '[]"')
instance_ips=$(echo "$instance_ips" | tr ',' ' ')
# supprimer les retours à la ligne
instance_ips=$(echo "$instance_ips" | tr -d '\n')



# Écrire l'en-tête [manager] dans le fichier de sortie
echo "[manager]" > inventory
set -- $instance_ips
echo "$1 ansible_ssh_private_key_file=./myKey.pem ansible_user=ubuntu" >> inventory

echo "[workers]" >> inventory
# Boucle sur chaque adresse IP et écrire la ligne formatée dans le fichier de sortie
shift

for ip; do
  echo "$ip ansible_ssh_private_key_file=./myKey.pem ansible_user=ubuntu" >> inventory
done

echo "Le fichier inventory a été créé avec succès."