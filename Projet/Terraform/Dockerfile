FROM hashicorp/terraform:latest

# Installer les dépendances nécessaires
RUN apk add --no-cache python3 py3-pip bash

# Créer un environnement virtuel pour awscli
RUN python3 -m venv /opt/venv

# Activer l'environnement virtuel et installer awscli
RUN /opt/venv/bin/pip install awscli

# Définir les variables d'environnement pour utiliser awscli dans le conteneur
ENV PATH="/opt/venv/bin:$PATH"

# Définir le répertoire de travail
WORKDIR /workspace

# Copier les fichiers Terraform
COPY . /workspace
