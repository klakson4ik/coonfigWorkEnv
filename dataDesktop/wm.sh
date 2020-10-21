#!/bin/bash
pathWM=$HOME/scripts/windowManager
configI3=$HOME/.config/i3

function choiceWindowManager(){
	cp -f $pathWM/$choice/config_i3 $HOME/.config/i3/config
	cp -f $pathWM/$choice/bash_profile $HOME/.bash_profile
}

function readChoiceWithoutParam(){
	echo "Выберите необходимую среду (укажите цыфру):"
	for value in $(ls $pathWM)
	do
		echo $count-$value 
		array+=($value)
		((++count))
	done
	read -n 1 -t 60 choice
}

function readChoiceFromParam(){
	for value in $(ls $pathWM)
	do
		array+=($value)
		((++count))
	done
}

declare -a array
count=1
if [ "$1" ]
then
	readChoiceFromParam
	if (echo "$1" | grep -E -q "^?[^0-9]+$") 
	then
   	echo "$1 - Не является числом"
		exit
	elif [ "$1" -lt 1 ] || [ "$1" -gt "$count" ]
	then
		echo "Неправильный параметр"
		exit
	else
		choice=${array[$1-1]}
		choiceWindowManager 
	fi
else	  
	readChoiceWithoutParam
	if (echo "$choice" | grep -E -q "^?[^0-9]+$") 
	then
   	echo " - Не является числом"
		exit
	elif [ "$choice" -lt 1 ] || [ "$choice" -gt "$count" ]
	then
		echo "Неверный выбор"
		exit
	else
		choice=${array[$choice-1]}
		choiceWindowManager 
	fi
fi

startx
