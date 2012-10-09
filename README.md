SUEGlobal - Sistema de Información de resultados de Empleo Universitario
===

Instalación de puesto de desarrollador
---

Lo primero es instalar Ruby, RoR, bundle y PostgreSQL. La instalación es
simple aunque depende de vuestro sistema operativo. Una búsqueda en Google
hace milagros.

Posteriormente, se ha de copiar el archivo `config/database.yml.template` a
`config/database.yml` y configurar ahí el acceso a las bases de datos de
desarrollo y testeo.

Una vez hecho esto, desde la línea de comandos instalaremos las dependencias
ejecutando el comando `bundle` y crearemos las bases de datos con
`rake db:create`. Si todo ha ido correctamente, sólo necesitaremos añadir la
estructura de la base de datos con el comando `rake db:migrate`.

Máquina virtual de producción
-----------------------------

Necesita tener instalado git y postgresql
