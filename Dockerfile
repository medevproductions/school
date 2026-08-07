FROM odoo:18.0

USER root

# Copy all Edu custom modules to Odoo addons path
COPY ./openeducat/openeducat_erp-18.0-beta/ /extra-addons/

USER odoo
