for nomDB in 'cat listeDB.txt'
do
    pg_dump -h localhost -U admin --format=custom --file $nomDB.dump $nomDB;
done

dateDuJour=$(date +"Dates: %d-%m-%Y---%HH%MM%SS" | cut -b 8-)

mkdir /home/user/dbsave/$dateDuJour

mv ./* /home/user/dbsave/$dateDuJour
