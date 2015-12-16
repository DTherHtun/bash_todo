
while [ : ]
do
stop=`date | awk '{ print $4 }'|cut -d":" -f3`
	if [ "00" = "$stop" ];then
		tput setaf 9
		break
	elif [ "60" = "$stop" ];then
		tput setaf 9
	 	break
	elif [ "30" = "$stop" ];then
		tput setaf 9
		break
	elif [ "15" = "$stop" ];then
		tput setaf 9
		break
	elif [ "45" = "$stop" ];then
		tput setaf 9
		break
	else
    echo -ne $(tput cup 12 1) $(tput setaf 1) '|\r'
    sleep 0.03
    echo -ne $(tput cup 12 1) $(tput setaf 2) '/\r'
    sleep 0.03
    echo -ne $(tput cup 12 1) $(tput setaf 3) '一\r'
    sleep 0.03
    echo -ne $(tput cup 12 1) $(tput setaf 4) '\\\r'
    sleep 0.05
    echo -ne $(tput cup 12 1) $(tput setaf 5) '|\r'
    sleep 0.05
    echo -ne $(tput cup 12 3) $(tput setaf 6) '$\r'
    sleep 0.03
    echo -ne $(tput cup 12 1) $(tput setaf 7) '@\r'
    sleep 0.03
    echo -ne $(tput cup 12 1) $(tput setaf 8) '!\r'
    sleep 0.05
    echo -ne $(tput cup 12 2) $(tput setaf 1) '%\r'
    sleep 0.05
    echo -ne $(tput cup 12 2) $(tput setaf 1) '|\r'
    sleep 0.02
    echo -ne $(tput cup 12 1) $(tput setaf 2) '/\r'
    sleep 0.02
    echo -ne $(tput cup 12 2) $(tput setaf 3) '一\r'
    sleep 0.02
    echo -ne $(tput cup 12 2) $(tput setaf 4) '\\\r'
    sleep 0.02
    echo -ne $(tput cup 12 3) $(tput setaf 5) '|\r'
    sleep 0.02
    echo -ne $(tput cup 12 2) $(tput setaf 6) '$\r'
    sleep 0.05
    echo -ne $(tput cup 12 2) $(tput setaf 7) '@\r'
    sleep 0.03
    echo -ne $(tput cup 12 2) $(tput setaf 8) '!\r'
    sleep 0.05
    echo -ne $(tput cup 12 2) $(tput setaf 9) '%\r'
    sleep 0.03
    echo -ne $(tput cup 12 3) $(tput setaf 1) '|\r'
    sleep 0.03
    echo -ne $(tput cup 12 3) $(tput setaf 2) '/\r'
    sleep 0.05
    echo -ne $(tput cup 12 1) $(tput setaf 3) '一\r'
    sleep 0.02
    echo -ne $(tput cup 12 3) $(tput setaf 4) '\\\r'
    sleep 0.02
    echo -ne $(tput cup 12 5) $(tput setaf 5) '|\r'
    sleep 0.05
    echo -ne $(tput cup 12 3) $(tput setaf 6) '$\r'
    sleep 0.03
    echo -ne $(tput cup 12 3) $(tput setaf 7) '@\r'
    sleep 0.03
    echo -ne $(tput cup 12 5) $(tput setaf 8) '!\r'
    sleep 0.02
    echo -ne $(tput cup 12 3) $(tput setaf 1) '%\r'
    sleep 0.01
    echo -ne $(tput cup 12 4) $(tput setaf 1) '|\r'
    sleep 0.02
    echo -ne $(tput cup 12 6) $(tput setaf 2) '/\r'
    sleep 0.01
    echo -ne $(tput cup 12 4) $(tput setaf 3) '一\r'
    sleep 0.02
    echo -ne $(tput cup 12 6) $(tput setaf 4) '\\\r'
    sleep 0.03
    echo -ne $(tput cup 12 4) $(tput setaf 5) '|\r'
    sleep 0.03
    echo -ne $(tput cup 12 5) $(tput setaf 6) '$\r'
    sleep 0.02
    echo -ne $(tput cup 12 6) $(tput setaf 7) '@\r'
    sleep 0.03
    echo -ne $(tput cup 12 4) $(tput setaf 8) '!\r'
    sleep 0.03
    echo -ne $(tput cup 12 1) $(tput setaf 9) '%\r'
    sleep 0.02
    echo -ne $(tput cup 12 4) $(tput setaf 1) '|\r'
    sleep 0.03
    echo -ne $(tput cup 12 1) $(tput setaf 2) '/\r'
    sleep 0.02
    echo -ne $(tput cup 12 2) $(tput setaf 3) '一\r'
    sleep 0.03
    echo -ne $(tput cup 12 1) $(tput setaf 4) '\\\r'
    sleep 0.02
    echo -ne $(tput cup 12 2) $(tput setaf 5) '|\r'
    sleep 0.03
    echo -ne $(tput cup 12 1) $(tput setaf 6) '$\r'
    sleep 0.02
    echo -ne $(tput cup 12 3) $(tput setaf 4) '@\r'
    sleep 0.03
    echo -ne $(tput cup 12 1) $(tput setaf 8) '!\r'
    sleep 0.02
    echo -ne $(tput cup 12 3) $(tput setaf 1) '%\r'
    sleep 0.03
    echo -ne $(tput cup 12 2) $(tput setaf 1) '|\r'
    sleep 0.02
    echo -ne $(tput cup 12 5) $(tput setaf 2) '/\r'
    sleep 0.03
    echo -ne $(tput cup 12 2) $(tput setaf 3) '一\r'
    sleep 0.02
    echo -ne $(tput cup 12 6) $(tput setaf 4) '\\\r'
    sleep 0.03
    echo -ne $(tput cup 12 6) $(tput setaf 5) '|\r'
    sleep 0.02
    echo -ne $(tput cup 12 2) $(tput setaf 6) '$\r'
    sleep 0.03
    echo -ne $(tput cup 12 5) $(tput setaf 7) '@\r'
    sleep 0.02
    echo -ne $(tput cup 12 2) $(tput setaf 8) '!\r'
    sleep 0.02
    echo -ne $(tput cup 12 6) $(tput setaf 6) '%\r'
    sleep 0.01

	fi
done

