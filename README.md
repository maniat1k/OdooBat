# Instalador de Odoo en Windows con Script `.bat`

Este proyecto tiene como objetivo automatizar la instalación de **Odoo 16** en **Windows 11** de forma similar a como se hace en sistemas Linux. Utiliza un script `.bat` que ejecuta un archivo de **PowerShell** para descargar e instalar automáticamente las dependencias necesarias, incluyendo PostgreSQL, Python, Git, Node.js y PyCharm.

---

## **Descripción del Proyecto**
El instalador automatiza los siguientes pasos:
1. Descarga y configuración de PostgreSQL.
2. Instalación y configuración de Python (incluye `pip` y entorno virtual).
3. Instalación de Git y Node.js.
4. Clonación del repositorio de Odoo 16 desde GitHub.
5. Creación de un archivo de configuración y arranque del servicio de Odoo.
6. Instalación opcional de **PyCharm Community Edition** para el entorno de desarrollo.

---

## **Cómo Crear el Archivo `.bat`**

Sigue estos pasos para crear el archivo `.bat` desde cero:
1. Crea un archivo de texto en tu computadora.
2. Copia el contenido del archivo `.bat` proporcionado.
3. Guarda el archivo con extensión `.bat` (por ejemplo: `Install-Odoo.bat`).
4. Ejecuta el archivo `.bat` como **Administrador** para que pueda realizar todas las instalaciones y configuraciones.

---

## **Cómo Ejecutar el Archivo `.bat`**

- Haz clic derecho sobre el archivo `.bat` y selecciona **"Ejecutar como Administrador"**.
- El script descargará y configurará las dependencias automáticamente.
- Una vez completada la instalación, puedes abrir Odoo en tu navegador visitando:  
http://localhost:8069

markdown
Copiar código

---

## **Requisitos Previos**
- **Sistema operativo:** Windows 11.
- **Permisos de administrador:** Para ejecutar el script correctamente.
- **Conexión a Internet:** Para descargar las dependencias.

---

## **Detalles Técnicos**
### Dependencias Instaladas
1. **PostgreSQL** (para la base de datos).
2. **Python 3.11** (con `virtualenv` y `pip`).
3. **Git** (para clonar el repositorio).
4. **Node.js** (para ejecutar dependencias JS de Odoo).
5. **PyCharm Community Edition** (opcional, para el entorno de desarrollo).

### Archivos Creados
- `C:\odoo\odoo`: Carpeta principal del repositorio clonado.
- `C:\odoo\odoo.conf`: Archivo de configuración de Odoo.
- `C:\Windows\System32\odoo.bat`: Archivo de arranque de Odoo como comando ejecutable.

---

## **Consideraciones Adicionales**
- Si PowerShell bloquea la ejecución de scripts, ejecuta este comando en PowerShell como administrador: Set-ExecutionPolicy RemoteSigned

- Si ya tienes PostgreSQL o Python instalados, el script detectará estas herramientas y no volverá a instalarlas.
- Revisa que psql (PostgreSQL) esté agregado al PATH. Si no lo está, el script lo agregará automáticamente.
- Licencia: Este proyecto se distribuye bajo la licencia MIT. Puedes utilizarlo, modificarlo y redistribuirlo libremente.

Autor
Usuario de GitHub: @maniat1k
Proyecto diseñado para facilitar la instalación de Odoo en sistemas Windows de manera automatizada.
