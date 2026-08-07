#!/bin/bash
set -e

# 1. Guardar el puerto web que asigna Railway (si existe) para el servidor de Odoo
RAILWAY_WEB_PORT=${PORT:-8069}

if [ "$PGUSER" = "postgres" ]; then
    echo "Creating odoo user to bypass postgres root user security restriction..."
    export PGPASSWORD=$PGPASSWORD
    psql -h "$PGHOST" -p "${PGPORT:-5432}" -U "$PGUSER" -d postgres -c "CREATE USER odoo WITH PASSWORD 'odoo_railway' CREATEDB;" || true
    psql -h "$PGHOST" -p "${PGPORT:-5432}" -U "$PGUSER" -d postgres -c "ALTER USER odoo WITH SUPERUSER;" || true
    
    ODOO_USER="odoo"
    ODOO_PASSWORD="odoo_railway"
else
    ODOO_USER="$PGUSER"
    ODOO_PASSWORD="$PGPASSWORD"
fi

# 2. El script de fábrica de Odoo (entrypoint.sh) fuerza el uso de HOST, PORT, USER y PASSWORD.
# Si no las reescribimos aquí, el script de fábrica sobreescribirá nuestras opciones.
export HOST="$PGHOST"
export PORT="$PGPORT"
export USER="$ODOO_USER"
export PASSWORD="$ODOO_PASSWORD"

# 3. Ejecutar Odoo. Forzamos el puerto 8069 y activamos proxy-mode
exec /entrypoint.sh odoo \
    --http-port=8069 \
    --proxy-mode \
    --database="${PGDATABASE:-postgres}" \
    --load-language=es_ES \
    -i base,openeducat_core,openeducat_erp,openeducat_admission,openeducat_fees,account,openeducat_exam,openeducat_attendance,openeducat_timetable,openeducat_parent,openeducat_activity,openeducat_facility,openeducat_classroom,openeducat_assignment,openeducat_library
