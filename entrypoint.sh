#!/bin/bash
set -e

# Ignorar la variable PORT de Railway para la base de datos
unset PORT

# Ejecutar Odoo forzando los datos de conexión de Postgres que provee Railway
exec /entrypoint.sh odoo \
    --db_host="${PGHOST}" \
    --db_port="${PGPORT:-5432}" \
    --db_user="${PGUSER}" \
    --db_password="${PGPASSWORD}" \
    --database="${PGDATABASE:-postgres}"
