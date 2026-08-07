#!/bin/bash
set -e

# Ignorar la variable PORT de Railway para la base de datos
unset PORT

if [ "$PGUSER" = "postgres" ]; then
    echo "Creating odoo user to bypass postgres root user security restriction..."
    export PGPASSWORD=$PGPASSWORD
    psql -h "$PGHOST" -p "${PGPORT:-5432}" -U "$PGUSER" -d postgres -c "CREATE USER odoo WITH PASSWORD 'odoo_railway' CREATEDB;" || true
    psql -h "$PGHOST" -p "${PGPORT:-5432}" -U "$PGUSER" -d postgres -c "ALTER USER odoo WITH SUPERUSER;" || true
    
    export ODOO_USER="odoo"
    export ODOO_PASSWORD="odoo_railway"
else
    export ODOO_USER="$PGUSER"
    export ODOO_PASSWORD="$PGPASSWORD"
fi

# Ejecutar Odoo forzando los datos de conexión de Postgres que provee Railway
exec /entrypoint.sh odoo \
    --db_host="${PGHOST}" \
    --db_port="${PGPORT:-5432}" \
    --db_user="${ODOO_USER}" \
    --db_password="${ODOO_PASSWORD}" \
    --database="${PGDATABASE:-postgres}"
