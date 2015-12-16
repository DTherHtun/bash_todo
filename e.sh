#!/bin/bash
c1()
{
    echo "           _^____      "
    echo "   L    __/    []\\     "
    echo "  LOL===_         \\    "
    echo "   L     \\_________]   "
    echo "           I   I       "
    echo "          -------/     "
    sleep 0.1
}
c2()
{
    echo "           _^____      "
    echo "  L L   __/    []\\     "
    echo "   O====_         \\    "
    echo "  L L    \\_________]   "
    echo "           I   I       "
    echo "          -------/     "
    sleep 0.1
}

echo -e "\n\n\n\n\n\n\n\n\n\033[8F\033[s"
while true
do
stop=`date | awk '{ print $4 }'|cut -d":" -f3`
        if [ "00" = "$stop" ];then
                
		tput clear
                echo "$(tput setaf 6) Bye bye ! $(tput setaf 9)"
		break
        elif [ "60" = "$stop" ];then
                
		tput clear
                echo "$(tput setaf 6) Bye bye ! $(tput setaf 9)"
		break
        elif [ "30" = "$stop" ];then
                
		tput clear
                echo "$(tput setaf 6) Bye bye ! $(tput setaf 9)"
		break
        elif [ "15" = "$stop" ];then
                
		tput clear
                echo "$(tput setaf 6) Bye bye ! $(tput setaf 9)"
		break
        elif [ "45" = "$stop" ];then
                
		tput clear
                echo "$(tput setaf 6) Bye bye ! $(tput setaf 9)"
		break
 	else
    echo -e "$(tput setaf 6)\033[u   ROFL:ROFL:ROFL:ROFL " ; c1
    echo -e "\033[u     LOL:LOL:LOL:LOL   " ; c2
    echo -e "$(tput setaf 4)\033[u        ROFL:ROFL      " ; c1
    echo -e "\033[u           LOL         " ; c2
    echo -e "$(tput setaf 2)\033[u        ROFL:ROFL      " ; c1
    echo -e "\033[u     LOL:LOL:LOL:LOL   " ; c2
    echo -e "$(tput setaf 1)\033[u   ROFL:ROFL:ROFL:ROFL " ; c1
    echo -e "\033[u     LOL:LOL:LOL:LOL   " ; c2
    echo -e "$(tput setaf 3)\033[u        ROFL:ROFL      " ; c1
    echo -e "\033[u           LOL         " ; c2
    echo -e "$(tput setaf 5)\033[u        ROFL:ROFL      " ; c1
    echo -e "\033[u     LOL:LOL:LOL:LOL   "$(tput setaf 9) ; c1
    fi
done



















