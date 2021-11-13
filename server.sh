#! /bin/bash
function do_for_sigint() {
  sudo /opt/lampp/lampp stopmysql
  echo "Spegnimento Server in corso"
  sleep 1s
  echo "Bye"
  exit 0
}

echo  "Comandi server:"
echo  "     1->Start&Run" 
echo  "     2->Start MySqlServer"
echo  "     3->Stop MySqlServer"
echo  "     4->Esegui MySql_Update"
echo   -n "Esegui :"
read CMD
trap do_for_sigint 2
case $CMD in
  1)	sudo /opt/lampp/lampp startmysql && sudo /opt/lampp/manager-linux-x64.run 
	;;
  2)	sudo /opt/lampp/lampp startmysql
	;;
  3)	sudo /opt/lampp/lampp stopmysql	
	;;
  4)	sudo /opt/lampp/bin/mysql_upgrade 	
	;;	
  *)
 	echo “Scelta CMD non valida”
 	sleep 1.5s
	exit 0
	;;
esac
