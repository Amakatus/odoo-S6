echo "Nom machine base de donnee:" && read name1
echo "IP machine base de donnee:" && read adressIP1

echo "Nom machine de sauvegarde:" && read name2
echo "IP machine de sauvegarde:" && read adressIP2

echo "Nom machine odoo:" && read name3
echo "IP machine odoo:" && read adressIP3

echo $adressIP1 > /config/ipBD.txt
echo $adressIP2 > /config/ipSAVE.txt
echo $adressIP3 > /config/ipODOO.txt

./createVM.sh $name1 $adressIP1 postgres $adressIP2 $adressIP3
./createVM.sh $name2 $adressIP2 save $adressIP1
./createVM.sh $name3 $adressIP3 odoo