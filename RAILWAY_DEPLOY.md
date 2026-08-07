# Pasos para desplegar el sistema "Edu" en Railway

## 1. Archivos creados
- **[Dockerfile](file:///c:/Users/Admin/Documents/Escuela/Proyecto%20escuela/Dockerfile)**: Configurado para cargar Odoo 18 con todos los módulos rebrandeados a **Edu** (sin marcas de agua de OpenEduCat).
- **[docker-compose.yml](file:///c:/Users/Admin/Documents/Escuela/Proyecto%20escuela/docker-compose.yml)**: Para pruebas con contenedores localmente.

---

## 2. Pasos para desplegar en Railway

1. **Subir este proyecto a GitHub**:
   - Crea un repositorio en tu cuenta de GitHub (ej. `edu-school-erp`).
   - Sube todos los archivos de la carpeta `c:\Users\Admin\Documents\Escuela\Proyecto escuela`.

2. **Crear el Proyecto en Railway**:
   - Entra a [Railway.app](https://railway.app) e inicia sesión.
   - Haz clic en **+ New Project** -> **Database** -> **Add PostgreSQL**.
   - Haz clic en **+ New** -> **GitHub Repo** y selecciona tu repositorio `edu-school-erp`.

3. **Configurar las Variables de Entorno en Railway**:
   En el servicio de tu repositorio en Railway, ve a la pestaña **Variables** y agrega:
   - `HOST` = `${{Postgres.DATABASE_HOST}}` (o la variable del host de tu base de datos PostgreSQL)
   - `USER` = `${{Postgres.POSTGRES_USER}}`
   - `PASSWORD` = `${{Postgres.POSTGRES_PASSWORD}}`
   - `PORT` = `8069`

4. **Acceder a tu aplicación**:
   - Ve a **Settings -> Networking -> Generate Domain** en Railway.
   - Abre la URL generada. ¡Tu sistema educativo **Edu** estará online funcionando sobre Odoo 18!
