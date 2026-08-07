#!/bin/bash
set -e

# Railway sets PORT variable for HTTP server, but Odoo entrypoint confuses PORT with DB PORT.
# We explicitly override DB port variables for Odoo script.

export PGPORT=5432
export DB_PORT=5432

exec /entrypoint.sh odoo "$@" --db_port=5432
