#!/bin/bash
nameProject=$1
configPath=$HOME/scripts/configWorkEnv/dataDesktop
scriptPath=$HOME/scripts/windowManaer/$namePath

function copyWeb(){
	cp -r $configPath/config_i3 $scriptPath
	cp -r $configPath/start.sh $scriptPath
}

mkdir -p $scriptPath
copyWeb

sed -i '2,5s/nameProject=name/nameProject=$nameProject/' $scriptPath/start.sh
sed -i 's/set $pathProject $HOME\/scripts\/windowManager\/name/set $pathProject $HOME\/scripts\/windowManage\/$nameProject/' $scriptPath/config_i3

git clone https://githib.com/klakson4ik/framework

