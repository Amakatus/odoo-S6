echo "Nom machine base de donnee:" && read name1
echo "IP machine base de donnee (sans le netmask):" && read adressIP1

echo "Nom machine de sauvegarde:" && read name2
echo "IP machine de sauvegarde (sans le netmask):" && read adressIP2

echo "Nom machine odoo:" && read name3
echo "IP machine odoo (sans le netmask):" && read adressIP3

echo $adressIP1 > ./config/ip/ipBD.txt
echo $adressIP2 > ./config/ip/ipSAVE.txt
echo $adressIP3 > ./config/ip/ipODOO.txt


cat ./config/fichierBasique/config >> ~/.ssh/config
sed -i -e "s/xxxx/$adressIP3/g" ~/.ssh/config

./createVM.sh $name1 $adressIP1 postgres $adressIP2 $adressIP3
./createVM.sh $name2 $adressIP2 save $adressIP1
./createVM.sh $name3 $adressIP3 odoo