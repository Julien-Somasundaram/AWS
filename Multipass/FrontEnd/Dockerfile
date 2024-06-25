FROM node:21

WORKDIR /app
RUN apt-get update && apt-get install -y netcat-openbsd
# Copier le package.json et package-lock.json (si présent)
COPY MyApp/Front-End/package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers du projet
COPY MyApp/Front-End .

# Copier le script d'initialisation
COPY FrontEnd/init.sh .

# Rendre le script exécutable
RUN chmod +x init.sh

# Exposer le port 5173 pour le frontend
EXPOSE 5173

# Construire les fichiers statiques et copier dans /usr/share/nginx/html
RUN npm run build 

# Démarrer avec le script d'initialisation
CMD ["./init.sh"]
