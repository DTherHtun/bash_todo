#!/bin/bash

. "bashtasklog.sh"
. "generate-form.sh"
#sqluser="mws"
#sqlpasswd="b2tvE5CchC8hSDjh"
#db="test"

bash cwflash.sh

new bashtasklog msg

function read_data(){
tput clear
form 3
echo -n "$(tput cup 2 23) Mysql-User $(tput cup 5 23) Mysql-passwd $(tput cup 8 23) DB-Name "
echo -n "$(tput cup 2 38)" & read sqluser
echo -n "$(tput cup 5 38)" & read sqlpasswd
echo -n "$(tput cup 8 38)" & read db
if [ -z $sqluser ] ; then
	tput clear
	msg.printFail "Mysql-User Can't be Empty !"
	f
elif [ -z $sqlpasswd ] ; then
	tput clear
	msg.printFail "Mysql-Password Can't be Empty !"
	f
elif [ -z $sqlpasswd ] ; then
	tput clear
	msg.printFail "Database Name Can't be Empty !"
	sleep 1
	f
else
	tput cup 11 15	msg.printOk
	sleep 1
	clear




start(){

mysql -u "$sqluser" -p"$sqlpasswd" -e"create database $db;use $db;CREATE TABLE user ( userid int(9) NOT NULL auto_increment,fullname VARCHAR(50) NOT NULL,username VARCHAR(40) NOT NULL,email VARCHAR(40) NOT NULL,password VARCHAR(40) NOT NULL,UNIQUE(username),UNIQUE(email),PRIMARY KEY(userid) )ENGINE = MYISAM ;CREATE TABLE todo (todoid int(10) NOT NULL auto_increment,title varchar(255) NOT NULL,description TEXT NOT NULL,tododate date NOT NULL,userid int(9) NOT NULL default 0,id int(10) NOT NULL default 0, PRIMARY KEY (todoid), KEY userid (userid))ENGINE=MYISAM ;"
	msg.printOk
}
    
start
bash loading.sh
echo -e "$(tput cup 15 27) Installation Success !\n"

fi
}

read_data



