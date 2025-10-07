#!/bin/sh

# Host y puerto de la DB
DB_HOST=${DB_HOST:-db}
DB_PORT=${DB_PORT:-5432}

echo "Esperando que PostgreSQL esté listo en $DB_HOST:$DB_PORT..."

# Espera hasta que la DB responda
until pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$SPRING_DATASOURCE_USERNAME" >/dev/null 2>&1; do
  echo "Esperando..."
  sleep 2
done

echo "PostgreSQL listo, iniciando la app..."
