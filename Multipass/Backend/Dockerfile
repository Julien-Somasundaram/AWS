FROM node:21

WORKDIR /app

# Copier le package.json et package-lock.json (si présent)
COPY MyApp/Back-End/package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers du projet
COPY MyApp/Back-End .

# Exposer le port 4000 pour le serveur GraphQL
EXPOSE 4000

# delay


# Démarrer l'application
RUN npm run prisma generate
COPY Backend/init.sh .
RUN chmod +x init.sh
CMD ["./init.sh"]
