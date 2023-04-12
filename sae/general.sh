echo "Nom machine 1:" && read name1
echo "IP machine 1:" && read ip1

echo "Nom machine 2:" && read name2
echo "IP machine 2:" && read ip2

echo "Nom machine 3:" && read name3
echo "IP machine 3:" && read ip3


./createVM.sh $name1 $ip1 postgres $ip2 $ip3
./createVM.sh $name2 $ip2 save $ip1
./createVM.sh $name3 $ip3 odoo