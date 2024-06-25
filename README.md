# Projet AWS avec Multipass, Ansible et Terraform

## Description
Ce projet a pour objectif de déployer une application sur AWS en utilisant Multipass pour la création de machines virtuelles, Ansible pour la gestion de la configuration et Terraform pour l'infrastructure en tant que code.

## Prérequis
- Docker
- Multipass
- Terraform
- Ansible

## Instructions de Déploiement

### 1. Utilisation de Multipass

Pour initialiser le réseau Docker Swarm et déployer les services, exécutez le script `launch.sh` dans le répertoire `Multipass` :
```bash
cd AWS/Multipass
sh launch.sh
```

### 2. Utilisation de Terraform

#### 2.1 Initialisation

Ajouter le fichier myKey.pem dans le répertoire `Terraform` et dans le repertoire `Ansible` pour permettre l'accès à la machine virtuelle.

Dans le ficheir launch.sh, ajouter la clé privée de votre clé publique pour permettre l'accès à la machine virtuelle.

#### 2.2 Terraform
Pour initialiser Terraform, exécutez les commandes suivantes :

```bash
cd AWS/Projet/Terraform
sh launch.sh
```
#### 2.3 Ansible

Copier le fichier inventory dans le répertoire `Ansible`.

Il se peut qu'il faut retirer un retour à la ligne dans le fichier inventory pour que Ansible puisse le lire.

Exécutez le script `launch.sh` dans le répertoire `Ansible` pour déployer l'application :

```bash
cd AWS/Projet/Ansible
sh launch.sh
```