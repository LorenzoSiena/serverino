#!/bin/bash

function init() {
tput rev
tput setaf 2
tput cup 1 24
echo " S E R V E R - I N O "
tput sgr0

tput setaf 3
tput cup 2 22
echo "by Lorenzo Siena"
tput sgr0

tput cup 4 0
tput setaf 1
sudo echo ""
}

function do_for_sigint() {
  clear
  sudo /opt/lampp/lampp stopmysql
  notify-send "Server shutdown in progress"
  tput setab 1
  tput cup 3 15 	
  echo "Server shutdown in progress"
  sleep 1s
  tput cup 4 15 
  echo "server off"
  sleep 1s
  tput sgr0
  clear
  exit 0
} 
#Init Sudo Permission
init
# clear the screen
tput clear

# Move cursor to screen location X,Y (top left is 0,0)
tput cup 3 15
 
# Set a foreground colour using ANSI escape
tput setaf 3
echo "by Lorenzo Siena"
tput sgr0
 
tput cup 5 17
# Set reverse video mode
tput rev
tput setaf 2
echo " S E R V E R - I N O "
tput sgr0
 
tput cup 7 15
tput setaf 2
echo "1. Start&Run"
 
tput cup 8 15
echo "2. Start MySqlServer"
 
tput cup 9 15
echo "3. Stop MySqlServer"
 
tput cup 10 15
echo "4. Run MySql_Update"
 
# Set bold mode
tput bold
tput cup 12 15
tput setaf 7
read -p "Select a command [1-4] " CMD
trap do_for_sigint 2
case $CMD in
  1)	sudo /opt/lampp/lampp startmysql && sudo /opt/lampp/manager-linux-x64.run
  	;;
  2)	sudo /opt/lampp/lampp startmysql
  	sleep 1s
  	tput cup 15 15
  	echo "Demon activated"
        
        sleep 2s

	tput clear
	tput sgr0
	tput rc
	clear
        exit 0
	;;
  3)	sudo /opt/lampp/lampp stopmysql	
	sleep 1s
	tput cup 15 15
	echo "Demon deactivated"
        sleep 2s

	tput clear
	tput sgr0
	tput rc
        clear
        exit 0
	;;
  4)	sudo /opt/lampp/bin/mysql_upgrade 	
	;;	
  *)
 	tput cup 15 15
 	tput setab 1
 	echo “Invalid command”
 	sleep 1.5s
	tput clear
	tput sgr0
	tput rc
	clear
	exit 0
	;;
esac 
 

tput clear
tput sgr0
tput rc
exit 1
