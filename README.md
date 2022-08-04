# ProgramasR
Codigo y tips de programacion en R

## Alguna vaina

```R
tryCatch(
  {
    print("Conectando a la Base de Datos...")
    con <- dbConnect(RPostgres::Postgres(),
                     dbname = db_name,
                     host = db_host,
                     port = db_port,
                     password = db_user_pw,
                     user = db_user)
  print("Conectando a la Base de Datos...")
  },
  error = function(e) print("Error conectando a la Base de Datos:",e),
  warning = function(w) print("Advertencia conectando a la Base de Datos", w))

```

