sudo -u postgres -i

psql -c 'select datname from pg_database;' > test.txt

cut 

cat test.txt | cut -d '\n' --fields 2-4
