#!/bin/bash

#stty -echo -icanon time 0 min 0 >/dev/null

DATA[0]="            _                        _                  "
DATA[1]="  ___ _   _| |__   ___ _ ____      _(_)_ __   __ _ ___  "
DATA[2]=" / __| | | | '_ \ / _ \ '__\ \ /\ / / | '_ \ / _\` / __|"
DATA[3]="| (__| |_| | |_) |  __/ |   \ V  V /| | | | | (_| \__ \ "
DATA[4]=" \___|\__, |_.__/ \___|_|    \_/\_/ |_|_| |_|\__, |___/ "
DATA[5]="      |___/                                  |___/      "


# virtual coordinate system is X*Y ${#DATA} * 5

X=0
Y=0

draw_char() {
  x=$1
  y=$2

  tput cup $((Y + y)) $((X + x))

  printf %c ${DATA[y]:x:1}
}


trap 'exit 1' INT TERM
trap 'tput setaf 9;tput cvvis; clear' EXIT

tput civis
clear

while :; do
stop=`date | awk '{ print $4 }'|cut -d":" -f3`
        if [ "00" = "$stop" ];then

                tput clear
                echo "$(tput setaf 9)"
                break
        elif [ "60" = "$stop" ];then

                tput clear
                echo " $(tput setaf 9)"
                break
        elif [ "30" = "$stop" ];then

                tput clear
                echo "$(tput setaf 6) $(tput setaf 9)"
                break
        elif [ "15" = "$stop" ];then

                tput clear
                echo "$(tput setaf 6) $(tput setaf 9)"
                break
        elif [ "45" = "$stop" ];then

                tput clear
                echo "$(tput setaf 9)"
                break
	elif [ "10" = "$stop" ];then
	 	tput clear
		tput setaf 9
		break
	else

for ((c=1; c <= 7; c++)); do
  tput setaf $c
  for ((x=0; x<${#DATA[0]}; x++)); do
    for ((y=0; y<=5; y++)); do
      draw_char $x $y
#stop=`date | awk '{ print $4 }'|cut -d":" -f3`

    done
	
  done
	
done
	
fi
done
#stty echo icanon time 1 min 1 >/dev/null




















