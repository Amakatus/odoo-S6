if [ -a requestDB.txt]
then
    rm requestDB.txt
fi

if [ -a nameDB.txt]
then
    rm requestDB.txt
fi

psql -c 'select datname from pg_database;' > requestDB.txt

nbLigne=$(wc -l requestDB.txt | cut -d ' ' -f 1)

for ((i=3 ; i<$nbLigne-1 ; i++))
do
    sed -n ''$i'p' test.txt >> nameDB.txt
done 

for j in $(cat nameDB.txt)
do
    pg_dump --format=custom --file $j.dump $j
done

