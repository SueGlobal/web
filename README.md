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

Crea el usuario y la base de datos dentro de la consola ```psql```

```
create user sue with password 'my_password';
create database sue_production owner sue;
```

Y poner los datos en el fichero ```config/database.yml```

Recuerda usar ```bundle config build.pg --with-pg-config=/path/to/pg_config```

En config/unicorn.rb, recordad que el usuario que pongais tiene que estar en
users, staff o similar.
