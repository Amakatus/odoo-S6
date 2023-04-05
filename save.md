## Sauvegarde en .dump 
 
pg_dump --format=custom --file [mon_fichier.dump] [nom_de_la_base]

pg_restore --clean --dbname [nom_de_la_base_de_destination] [mon_fichier.dump]

```sql
pg_dump --format=custom --file admin.dump admin

pg_restore --clean --dbname admin admin.dump
```

## Sauvegarde en sql

pg_dump --format=plain --create --file [mon_fichier.sql] [nom_de_la_base]

psql --file [mon_fichier.sql] [nom_de_la_base]

```sql
pg_dump --format=plain --create --file admin2.sql admin

psql --file admin2.sql admin2
```