# Documentacion

## Instalacion con Docker
```Bash
docker run -d -p 8000:8787 \
           -e USER=<username> \
           -e PASSWORD=<password> \
           -e ROOT=TRUE \
           -v $(pwd):/home/rstudio \
           --name rstudio rocker/verse
```

## Conexion a Base de Datos

La función dbGetQuery de la librería RPostgreSQL presenta un pequeño fallo con al usar tryCatch

```R
tryCatch({dbGetQuery(connec,sql)},error = function(e) print(e),
         warning = function(w) print(w))
```
```Bash
> tryCatch({dbGetQuery(connec,sql)},error = function(e) print(e),
+          warning = function(w) print(w))
Error in postgresqlExecStatement(conn, statement, ...) : 
  RS-DBI driver: (@uEvV)
<simpleWarning in postgresqlQuickSQL(conn, statement, ...): Could not create execute:
```

Esto no sucede con la librería RPostgres
```R
tryCatch({dbSendQuery(con, sql)},error = function(e) print("Error"),
         warning = function(w) print("Warning"))
```
```Bash
> tryCatch({dbSendQuery(con, sql)},error = function(e) print("Error"),
+          warning = function(w) print("Warning"))
[1] "Error"
```
