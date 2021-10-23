
#! /bin/bash


echo  "Comandi server:\n"
echo  "\t1->XAMPP" 
echo  "\t2->StartALL"
echo  "\t3->StopALL"
read CMD

case $CMD in
  1)	sudo /opt/lampp/manager-linux-x64.run
;;

  2)	sudo /opt/lampp/lampp start
;;

  3)	sudo /opt/lampp/lampp stop	
;;

*)

echo “Scelta CMD non valida”

exit 1

esac
