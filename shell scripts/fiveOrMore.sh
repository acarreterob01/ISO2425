#!/bin/bash
#
#Autor: Toni Carretero Barroso


clear

echo "Toni Carretero Barroso"

	if [ $# -ne 2 ];then

		echo "Tiene que tener dos parámetros"
		exit
	fi
fich=$1
dir=$(ls $2 | wc -l)

	if [ -f $1 ]; then
	    echo "El archivo $fich ya existe"
	    exit
	fi

	if [ ! -d $2 ];then
		echo "El directorio no existe"
		exit
	fi

	if [ $dir -eq 0 ];then
		echo "El directorio está vacío"
		exit
	fi

	for arch in $2/*txt; do

		lineas=$(cat $arch | wc -l)

		if [ $lineas -ge 5 ];then
				echo $arch
				echo $arch >> $1

				wc -w $arch > $arch.q
				cat $arch >> $arch.q
		fi
	done

num=$(cat $1 | wc -l)
echo "Se han identificado $num lineas en el fichero $fich" >> $1
