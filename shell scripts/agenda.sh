#!/bin/bash
#
#
#
#

clear

while true; do

	echo "a- añadir una entrada"
	echo "b- Buscar por dni"
	echo "c- Ver la agenda completa"
	echo "d- Eliminar todas las entradas de la agenda"
	echo "e- Finalizar"

	read -p "Introduzca una opción: " op


	case $op in

		a)
			read -p "Introduce un DNI: " dni
				if   grep "^$dni:" agenda.txt > /dev/null ; then
					echo "Usuario ya existente"
				else
					echo "El usuario con el dni $dni no existe"
					read -p "Introduzca el nombre: " nom
					read -p "Introduzca los apellidos: " ape
					read -p "Introduzca la localidad: " loc
					$dni:$nom:$ape:$loc >> agenda.txt
				fi
		;;

		b)
			read -p "Introduce un DNI: " dni
			if  grep "^$dni:" agenda.txt > /dev/null ; then
				dni=$(grep $dni agenda.txt|cut -d ":" -f 1)
				nombre=$(grep $dni agenda.txt|cut -d ":" -f 2)
				apellidos=$(grep $dni agenda.txt|cut -d ":" -f 3)
				localidad=$(grep $dni agenda.txt|cut -d ":" -f 4)

				echo "La persona con DNI número $dni es: $nombre $apellidos,y vive en $localidad ."


			else
				echo "No existe la persona con este DNI"

			fi

		;;

		c)
			if [ -s agenda.txt ]; then
				cat agenda.txt

			else
				echo "Agenda vacía"
			fi
		;;

		d)

			> agenda.txt
		;;

		e)


			break
		;;

		*)
			echo "Opción no válida"

		;;

	esac
done
