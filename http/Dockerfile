FROM nginx:alpine

# Copier la configuration Nginx
COPY http/nginx.conf /etc/nginx/conf.d/default.conf

# Copier les fichiers construits du frontend
COPY --from=final-frontend /app/dist /usr/share/nginx/html
