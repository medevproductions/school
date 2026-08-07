FROM odoo:18.0

USER root

# Copy custom modules to Odoo extra-addons
COPY . /extra-addons/

USER odoo

