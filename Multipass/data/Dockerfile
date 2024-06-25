FROM postgres:13

# Copier le script d'initialisation depuis le répertoire data
COPY data/init.sql /docker-entrypoint-initdb.d/
