# Bases de Datos

Como conectarse a diversas bases de datos desde R

## PostgreSQL
Usando el paquete Rpostgres

```R
library(DBI)
library(RPostgres)
db_name <- 'xxxxxxx'      # Nombre de la Base de Datos
db_host <- 'x.x.x.x'      # Nombre o IP del Host
db_port <- 5432           # Puerto de Escucha del Servicio de BD
db_user <- 'postgres'     # Usuario con Acceso a la BD
db_user_pw <- '*********' # Password del Usuario de la BD

# Conectado a la Base de Datos
tryCatch(
  {
    print("Conectando a la Base de Datos...")
    con <- dbConnect(RPostgres::Postgres(),
                     dbname = db_name,
                     host = db_host,
                     port = db_port,
                     password = db_user_pw,
                     user = db_user)
  print("Conectado a la Base de Datos!")
  },
  error = function(e) print("Error conectando a la Base de Datos:",e),
  warning = function(w) print(w))

# Agregando una columna campo1 de tipo numeric a la tabla datos del esquema public
dbGetQuery(connec, "ALTER TABLE public.datos ADD COLUMN campo1 numeric;")

# Eliminando la columna campo1 de la tabla datos del esquema public
dbGetQuery(connec, "ALTER TABLE public.datos DROP COLUMN campo1;")

# Desconectando de la Base de Datos
dbDisconnect(con)

```
