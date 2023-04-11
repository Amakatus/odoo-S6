for i in 'cat listeDB.txt'
do
    pg_dump -h localhost -U admin --format=custom --file $i.dump $i;
done

mv ./* /home/user/dbsave