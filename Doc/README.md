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
## Agregar un usuario nuevo a R Studio Server
Nota: Simplemente se agrega un usuario al sistema

```Bash
# docker exec -it rstudio bash
root@941c8ca62696:/# adduser usuario
Adding user `usuario' ...
Adding new group `usuario' (1001) ...
Adding new user `usuario' (1001) with group `usuario' ...
Creating home directory `/home/usuario' ...
Copying files from `/etc/skel' ...
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for usuario
Enter the new value, or press ENTER for the default
	Full Name []: Usuario Invitado
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] Y
root@941c8ca62696:/#
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
