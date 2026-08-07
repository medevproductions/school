FROM odoo:18.0

USER root

# Copy custom modules to Odoo extra-addons
COPY . /extra-addons/

# Copy custom entrypoint wrapper
COPY entrypoint.sh /custom-entrypoint.sh
RUN chmod +x /custom-entrypoint.sh

EXPOSE 8069

USER odoo

ENTRYPOINT ["/custom-entrypoint.sh"]
