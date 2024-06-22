#!/bin/sh

# Attendre que le backend soit disponible
while ! nc -z backend 4000; do   
  echo "Attente du backend..."
  sleep 2
done

# Exécuter graphql-codegen
npx graphql-codegen

# Démarrer l'application frontend
npm run start
