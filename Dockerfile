FROM odoo:18.0

USER root

# Copy custom modules to Odoo extra-addons
COPY . /extra-addons/

EXPOSE 8069

USER odoo

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo", "--db_port=5432"]

