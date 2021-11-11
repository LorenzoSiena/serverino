
#! /bin/bash


echo  "Server Command:\n"
echo  "\t 1->Start&Run" 
echo  "\t 2->Start MySqlServer"
echo  "\t 3->Stop MySqlServer"
echo  "Execute #:"
read CMD
case $CMD in
  1)	sudo /opt/lampp/lampp startmysql && sudo /opt/lampp/manager-linux-x64.run 
;;

  2)	sudo /opt/lampp/lampp startmysql
;;

  3)	sudo /opt/lampp/lampp stopmysql	
;;

*)

echo “Scelta CMD non valida”

exit 1

esac
