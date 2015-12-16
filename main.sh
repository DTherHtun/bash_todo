#!/bin/bash

. "bashtasklog.sh"
. "connect.cfg"
. "color.sh"
. "generate-form.sh"

new bashtasklog msg
bold=`tput smso`
offbold=`tput rmso`
#bash cwflash.sh 
bash cwflash.sh.bak

function ex(){
bash e.sh
}


function todo_list(){

userid=`mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "select userid from user where username='$uname'"| tail -n 1`
date=`date +"%Y-%m-%d"`
###############################################################################################################################
todo_new(){
read_form
echo -e "$(tput cup 4 17) Title $(tput cup 6 17) Write todo "
echo -en "$(tput cup 4 17)" & read title
echo -en "$(tput cup 6 17)" & read description

if [ -z $title ];then
                         tput clear
                         echo -n "$(tput cup 4 10) $(tput setaf 1) [ Fail ] $(tput setaf 9) Title Can't be Empty !"
                         sleep 1
                         update_todo
elif [ -z $description ];then
                         tput clear
                         echo -n "$(tput cup 4 10) $(tput setaf 1) [ Fail ] $(tput setaf 9) Description Can't be Empty !"
                         sleep 1
                         update_todo
else
			mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "set @var=(select count(userid) from todo where userid=$userid);INSERT INTO todo ( title,description,tododate,userid,id) VALUES ( '$title','$description','$date','$userid',@var+1)"
			tput clear
			echo -n "$(tput cup 4 10) $(tput setaf 2) [ Ok ] $(tput setaf 9) Success Added !"
			sleep 2
			tput clear
			todo_list
fi
}
##################################################################################################################################
list_todo(){


row=`mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "select count(userid) from todo where userid='$userid'" | tail -n 1`
tab=`expr 1 + $(($row))`
id_row=`mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "select id from todo where userid='$userid'" | tail -n $row`
title_row=`mysql -u "$sqluser" -p"$sqlpasswd" -D $db -e "select title from todo where userid='$userid'"| tail -n $row`
table $tab

local c=2;
local d=2;
echo -e "$(tput cup $c 23) NO $(tput cup $d 40) Title"
#title 2 32
for a in $id_row ;do
c=`expr $c + 3`
echo -e "$(tput cup $c 23) $a"
done
for b in $title_row; do
d=`expr $d + 3`
echo -e "$(tput cup $d 32) $b"
done
d=`expr $d + 3`
echo  "$(tput cup $d 15) View to Enter NO (or ) Back to 'b' : "
echo -n "$(tput cup $d 54)" & read view
view_title=`mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "select title from todo where id='$view' and userid='$userid'" | tail -n 1`
view_description=`mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "select description from todo where id='$view' and userid='$userid'"`
view_description=`echo $view_description| awk '{ print $2" " $3" "$4" "$5" "$6" "$7" "$8" "$9" "$10" "$11" "$12" "$13" "$14" "$15" "$16" "$17" "$18" "$19" "$20" "$21" "$22" "$23" "$24" "$25 }'`
if [ -z "$view" ] ; then
        tput clear
        echo -n "$(tput cup 4 10) $(tput setaf 1) [ Fail ] $(tput setaf 9)  Number can't be empty !"
        sleep 1
        list_todo
elif [ "$view" = "b" ];then
        tput clear
        todo_list
else
        for v in $id_row;do
                if [ "$view" = "$v" ];then
                        vv=1
			break;
                else
                        vv=0
                fi
        done

        if [ "$vv" = 1 ];then

                tput clear
		read_form
                echo -e "$(tput cup 4 17) $view_title $(tput cup 6 17) $view_description"
		echo -e "$(tput cup 10 24) Enter 'b' to back or 'q' to quite : "
		echo -en "$(tput cup 10 60) " & read back
		if [ "$back" = 'b' ];then
			tput clear
			list_todo
		elif [ "$back" = 'q' ];then
			tput clear
			ex
		else
			list_todo
		fi

	else
		tput clear
                echo -n "$(tput cup 4 10) $(tput setaf 1) [ Fail ] $(tput setaf 9)  Input Number do not match !"
                sleep 1
                list_todo
	fi

fi
}
###############################################################################################################################
update_todo(){
row=`mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "select count(userid) from todo where userid='$userid'" | tail -n 1`
tab=`expr 1 + $(($row))`
id_row=`mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "select id from todo where userid='$userid'" | tail -n $row`
title_row=`mysql -u "$sqluser" -p"$sqlpasswd" -D $db -e "select title from todo where userid='$userid'"| tail -n $row`
table $tab

id_row=`mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "select id from todo where userid='$userid'" | tail -n $row`


local c=2;
local d=2;
echo -e "$(tput cup $c 23) NO $(tput cup $d 40) Title"
#title 2 32
for a in $id_row ;do
c=`expr $c + 3`
echo -e "$(tput cup $c 23) $a"
done
for b in $title_row; do
d=`expr $d + 3`
echo -e "$(tput cup $d 32) $b"
done
d=`expr $d + 3`
echo  "$(tput cup $d 15) Edit to Enter NO (or ) Back to 'b' : "
echo -n "$(tput cup $d 54)" & read no
update_title=`mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "select title from todo where id='$no' and userid='$userid'" | tail -n 1`
update_description=`mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "select description from todo where id='$no' and userid='$userid'"`
update_description=`echo $update_description| awk '{ print $2" " $3" "$4" "$5" "$6" "$7" "$8" "$9" "$10" "$11" "$12" "$13" "$14" "$15" "$16" "$17" "$18" "$19" "$20" "$21" "$22" "$23" "$24" "$25 }'`
if [ -z "$no" ] ; then
	tput clear
	echo -n "$(tput cup 4 10) $(tput setaf 1) [ Fail ] $(tput setaf 9) Edit Number can't be empty !"
	sleep 1
	update_todo
elif [ "$no" = "b" ];then
	tput clear
	todo_list
else
	for y in $id_row;do
		if [ "$no" = "$y" ];then
			yy=1
			break;
		else
			yy=0
		fi
	done

	if [ "$yy" = 1 ];then

		tput clear
		read_form
		echo -e "$(tput cup 4 17) $update_title $(tput cup 6 17) $update_description"
		echo -en "$(tput cup 4 17) " & read update_title
		echo -en "$(tput cup 6 17) " & read update_description
		if [ -z $update_title ];then
			tput clear
			echo -n "$(tput cup 4 10) $(tput setaf 1) [ Fail ] $(tput setaf 9) Title Can't be Empty !"
			sleep 1
			update_todo
		elif [ -z $update_description ];then
			tput clear
			echo -n "$(tput cup 4 10) $(tput setaf 1) [ Fail ] $(tput setaf 9) Description Can't be Empty !"
			sleep 1
			update_todo
		else
		mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "UPDATE todo SET title = '$update_title' where id='$no' and userid='$userid'"
		mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "UPDATE todo SET description = '$update_description' where id='$no' and userid='$userid'"

		echo "$(tput cup 9 20) $(tput setaf 2) [ Ok ] $(tput setaf 9) Todo Work Edited !"
		sleep 1
		tput clear
		list_todo
		fi
	else
		tput clear
		echo -n "$(tput cup 4 10) $(tput setaf 1) [ Fail ] $(tput setaf 9) Edit number do not match !"
		sleep 1
		update_todo
	fi
fi

}
###########################################################################################################
delete_todo(){

row=`mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "select count(userid) from todo where userid='$userid'" | tail -n 1`
tab=`expr 1 + $(($row))`
id_row=`mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "select id from todo where userid='$userid'" | tail -n $row`
title_row=`mysql -u "$sqluser" -p"$sqlpasswd" -D $db -e "select title from todo where userid='$userid'"| tail -n $row`
table $tab

local e=2;
local f=2;
echo -e "$(tput cup $e 23) NO $(tput cup $f 40) Title"

for g in $id_row ;do
e=`expr $e + 3`
echo -e "$(tput cup $e 23) $g"
done

for h in $title_row; do
f=`expr $f + 3`
echo -e "$(tput cup $f 32) $h"
done

f=`expr $f + 3`
echo  "$(tput cup $f 15) Delete to Enter NO (or) back to 'b' : "
echo -n "$(tput cup $f 54)" & read del_no

if [ -z "$del_no" ] ; then
	tput clear
	echo "$(tput setaf 1) [ Fail ] $(tput setaf 9)  Can't accept Empty number "
	sleep 2
	tput clear
	todo_list
fi
if [ "$del_no" = "b" ] ; then
tput clear
todo_list

else

for x in $id_row ; do
	if [ "$del_no" = "$x" ]; then
		xx=1
		break;
	else
		xx=0
	fi
done

if [ "$xx" = 1 ];then
	d=`expr $f + 3`
        mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "delete from todo where id='$del_no' and userid='$userid'"
        tput clear
        echo "$(tput cup $f 20) Delete Success !"
        sleep 1
        tput clear
        list_todo
else
	tput clear
	echo -n "$(tput cup 3 5)$(tput setaf 1) [ Fail ] $(tput setaf 9)Delete Number do not match !"
	sleep 2
	tput clear
	delete_todo
fi
fi
}
###################################################################################################################################
tput clear
echo -n "$(tput cup 2 10) $(tput setaf 3) $bold Cyberwings Simple Todo List Bash Application $offbold $(tput setaf 9)"
echo -n "$(tput cup 4 15) $(tput setaf 6)[1] $(tput setaf 9) - Add new todo"
echo -n "$(tput cup 5 15) $(tput setaf 6)[2] $(tput setaf 9) - List todo"
echo -n "$(tput cup 6 15) $(tput setaf 6)[3] $(tput setaf 9) - Edit todo"
echo -n "$(tput cup 7 15) $(tput setaf 6)[4] $(tput setaf 9) - Delete todo"
echo -n "$(tput cup 8 15) $(tput setaf 6)[b] $(tput setaf 9) - back"
echo -n "$(tput cup 9 15) $(tput setaf 6)[q] $(tput setaf 9) - quite"

echo -n "$(tput cup 13 10) $(tput setaf 2) [-] $(tput setaf 9)choice :: "
echo -n "$(tput cup 13 26)" & read tcho

case $tcho in
	1)	clear
		todo_new
		;;
	2)	clear
		list_todo
		;;
	3)	clear
		update_todo
		;;
	4)	clear
		delete_todo
		;;
	b)	clear
		session
		;;
	q)	clear
		ex
		;;
	*)	clear
		echo "$(tput cup 4 10) $(tput setaf 4) Input Error ! $(tput setaf 9)"
		todo_list
		;;
esac

}

change_pw(){

form 1
echo -en "$(tput cup 2 23)Current Passwd"
echo -en "$(tput cup 2 38)" & read pw

pw=`echo -n $pw | openssl dgst -md4 | openssl dgst -sha512 | openssl dgst -md5 | cut -d" " -f2`

if [ "$pw" != "$ps" ];then
	echo "Password Incorrect !"
	sleep 2
	change_pw
else

form 2
echo -en "$(tput cup 2 23) New Passwd $(tput cup 5 23) Comfirm "
echo -en "$(tput cup 2 38)" & read -s npw
echo -en "$(tput cup 5 38)" & read -s cpw



if [ "$npw" != "$cpw" ];then
	echo "Password not match !"
	change_pw
else
	cpw=`echo -n $cpw | openssl dgst -md4 | openssl dgst -sha512 | openssl dgst -md5 | cut -d" " -f2`

	`mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "UPDATE user SET password = '$cpw' where username='$uname' "`
	msg.printOk "Update Success !"
	sleep 2
	session

fi
fi
tput setaf 9
}
session(){
fname=`mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "SELECT fullname FROM user WHERE username='$uname' "`
fname=`echo $fname|awk {' print $2" "$3" "$4" "$5" "$6" "$7 '}`

clear
echo "$(tput cup 2 10)$(tput setaf 6) Welcome From Here ! $(tput setaf 9)"

echo "$(tput cup 3 5) Hello $(tput setaf 3)$fname $(tput setaf 9)"
echo
echo
echo " $(tput cup 5 4) $(tput setaf 5) [1] $(tput setaf 9) - Todo "
echo " $(tput cup 6 4) $(tput setaf 5) [2] $(tput setaf 9) - Change Password"
echo " $(tput cup 7 4) $(tput setaf 5) [l] $(tput setaf 9) - logout"
echo
echo -n "$(tput cup 9 8) pls choice :: " & read num

case $num in
	1)	clear
		todo_list
		;;
	2)	clear
		change_pw
		;;
	l)
		clear
		echo "bye bye"
		ex
		;;
	*)	clear
		echo "Input Not Match !"
		sleep 1
		clear
		session
		;;
esac
}

login(){

form 2
echo -en "$(tput cup 2 23) User Name $(tput cup 5 23) Password "
echo -en "$(tput cup 2 38)" & read uname
echo -en "$(tput cup 5 38)" & read -s pass

pass=`echo -n $pass | openssl dgst -md4 | openssl dgst -sha512 | openssl dgst -md5 |cut -d" " -f2`

if [ -z "$uname" ];
then
	echo -e $COL_RESET $COL_RED"user name cann't be empty"$COL_RESET
	login
else
fetch $uname

if [ "$pass" == "$ps" ] ; then
msg.printOk "Success login !"
sleep 2
session
else
msg.printFail "Fail login !"
fi
fi
echo -e $COL_RESET
}


register(){

form 5
echo -en "$(tput cup 2 23) Full Name $(tput cup 5 23 ) User Name $(tput cup 8 23) Email $(tput cup 11 23) Password $(tput cup 14 23) Comfirm "

echo -en "$(tput cup 2 38)" & read fullname
echo -en "$(tput cup 5 38)" & read username
echo -en "$(tput cup 8 38)" & read email
echo -en "$(tput cup 11 38)" & read -s password
echo -en "$(tput cup 14 38)" & read -s cpassword

if [ -z "$fullname" ]
then
	echo -e $COL_RESET"$cls"
	echo -e $COL_RED"$mid Fullname Can't be empty !"$COL_RESET
	sleep 2
	register
else
	if [ -z "$username" ]
	then
		echo -e $COL_RESET"$cls"
		echo -e $COL_RED"$mid Username Can't be empty !"$COL_RESET
		sleep 2
		register
	else
		if [ -z "$email" ]
		then
			echo -e $COL_RESET"$cls"
			echo -e $COL_RED"$mid Email Can't be empty !"$COL_RESET
			sleep 2
			register
		else
			if [ -z "$password" ]
			then
				echo -e $COL_RESET"$cls"
				echo -e $COL_RED"$mid Password Can't be empty !"$COL_RESET
				sleep 2
				register
			else
				if [ "$password" != "$cpassword" ];
				then
					echo -e $COL_RESET $cls
					echo -e $COL_RED"$mid Password not match !"$COL_RESET
					sleep 2
					register
				else
cpassword=`echo -n $cpassword | openssl dgst -md4 | openssl dgst -sha512 | openssl dgst -md5 | cut -d" " -f2`

        mysql -u "$sqluser" -p"$sqlpasswd" -D "$db" -e "INSERT INTO user(fullname,username,email,password)values('$fullname','$username','$email','$cpassword')"

msg.printOk "Your Registration is complete.."
sleep 2
login
fi
fi
fi
fi
fi
tput setaf 9
}

function firstpage() {
tput clear
echo "$(tput cup 3 15) $(tput setaf 6) $bold Welcome From Cyberwings Dynamic todo list $offbold $(tput setaf 9)"
echo
echo "$(tput cup 5 5) $(tput setaf 3) [1]$(tput setaf 9) - Register"
echo "$(tput cup 6 5) $(tput setaf 3) [2]$(tput setaf 9) - Login"
echo "$(tput cup 7 5) $(tput setaf 3) [q]$(tput setaf 9) - exit"

echo -n "$(tput cup 9 7)pls choice :: "
echo -n "$(tput cup 9 21)" & read cho

case "$cho" in
	1) 	clear
		msg.printTask "Please Fill Form"
		register
		;;
	2)	clear
		msg.printTask "Please Login"
		login
		;;
	q)	clear
		msg.printTask "Bye Bye"
		echo -e "\n"
		sleep 1
		clear
		ex 
		;;
	*) 	clear
		msg.printFail "YOu must choice 1 & 2"
		sleep 2
		clear
		firstpage
		;;
esac

}

firstpage
