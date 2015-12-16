#!/bin/bash

function form-fun(){
#	local def=9
	      def=$1
	      two=`expr $def + 2`
	      three=`expr $two - 1`

form1=`tput cup $def 20`
form2=`tput cup $two 20`
form3=`tput cup $three 20`
form4=`tput cup $three 60`
slote=`tput cup $three 35`
left=`tput cup $three 23`
right=`tput cup $three 37`
}

function form(){
tput clear
local default=2
	b=$(( $1 * $default + $1))
#for ((i=1; i<=$b; i++));do

	for ((a=1; a<=$b; a++));do
form-fun $(($a))
bold=`tput smso`
offbold=`tput rmso`
echo "$(tput setaf 4) $bold"
echo -e "$form1 +---------------------------------------+"
echo -e "$form2 +---------------------------------------+"
echo -en "$form4 |"
echo -en "$form3 |"
echo -en "$slote | "
echo "$(tput setaf 9) $offbold"
#echo -en "$left hello"
#echo -en "$right aeiou"
a=`expr $a + 2`
done

#done
}


function table-fun(){
              def=$1
              two=`expr $def + 2`
              three=`expr $two - 1`

form1=`tput cup $def 20`
form2=`tput cup $two 20`
form3=`tput cup $three 20`
form4=`tput cup $three 60`
slote=`tput cup $three 28`
left=`tput cup $three 23`
right=`tput cup $three 37`
}


function table(){
tput clear
local default=2
        b=$(( $1 * $default + $1))

        for ((a=1; a<=$b; a++));do
table-fun $(($a))
bold=`tput smso`
offbold=`tput rmso`
echo "$(tput setaf 4) $bold"
echo -e "$form1 +---------------------------------------+"
echo -e "$form2 +---------------------------------------+"
echo -en "$form4 |"
echo -en "$form3 |"
echo -en "$slote | "
echo "$(tput setaf 9) $offbold"
a=`expr $a + 2`
done

}

function read_form(){

bold=`tput smso`
offbold=`tput rmso`

tput clear
echo -e "$(tput setaf 4) $bold"
echo -n "$(tput cup 3 15) +-----------------------------------------------+"
echo -n "$(tput cup 5 15) +-----------------------------------------------+"
echo -n "$(tput cup 8 15) +-----------------------------------------------+"
echo -en "$(tput cup 4 15) |"
echo -en "$(tput cup 4 63) |"
echo -en "$(tput cup 6 15) |"
echo -en "$(tput cup 7 15) |"
echo -en "$(tput cup 6 63) |"
echo -en "$(tput cup 7 63) |"
echo -e "$(tput setaf 9) $offbold"
echo -e "\n"
echo -e "\n\n"
}
table 2
