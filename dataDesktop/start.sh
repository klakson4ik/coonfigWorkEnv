#!/bin/bash
nameProject=name
pathProject=$HOME/web/$nameProject
pathScript=$HOME/scripts
dockerName=docker_php-fpm_1

function check_docker_run() {
	while [[ $(sudo docker ps --filter name=$dockerName --filter status=running  --filter status=restarting | wc -l) -eq 1 ]]
       do
          echo "Docker not running"
       done
}


function startWeb() {
	case $1 in
		jw)
			check_docker_run.sh
			clear
			cd $pathProject
			sudo make jw
			;;
		work_directory)
			cd $pathProject
			;;
		up)
			sudo systemctl start docker
			cd $pathProject
			sudo make up 
			;;
		work_vim)
			cd $pathProject
			vim
			;;
		*)
			echo "Неверный параметр"
	esac
}

startWeb $1
