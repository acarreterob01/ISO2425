#!/bin/bash
#
#
#Autor: Toni Carretero Barroso



clear

num=1000

echo "Informe de usuarios el día $(date +%D) a las $(date +%H:%M)"

IFS=:

while read us x uid gid d h shell; do

	if [ $# -eq 0 ];then

		uidmayor=$num
	else

		uidmayor=$1

	fi


	if [ $uid -ge $uidmayor ];then
		echo "$us - $uid"
		contador=$((contador+1))
	fi

		echo "$(date +%D) - $(date +%H:%M) El usuario $USER ha solicitado un informe de usuarios"  > /tmp/logeventos

done < /etc/passwd

echo "Total: $contador usuarios"
