#!/bin/bash
#
#Autor: Toni Carretero

echo "Toni Carretero"


if [ $# -ne 2 ]; then
    echo "Error, tiene que haber solo dos parámetros"
    exit
fi

fich=$1
opera=$2

if [ -f $fich ]; then
    echo "El archivo $fich ya existe"
    exit
fi

cont=0



while [ $cont -lt $opera ]; do

	echo “Primer valor S es Suma, R es Resta,M es Mult., D es Div. y X es salir luego, valor1 y valor2”
        read -p “Ingrese los valores: ” op op1 op2


    if [ $op == X ]; then
        break
    fi

       case $op in
        S)
            resul=$((op1 + op2))
            echo "Resultado: $op1 + $op2 = $resul"
            echo " $op1 $op2" >> $fich
            ;;
        R)
            resul=$((op1 - op2))
            echo " $op1 - $op2 = $resul"
            echo " $op1 $op2 ">> $fich
            ;;
        M)
            resul=$((op1 * op2))
            echo " $op1 * $op2 = $resul"
            echo " $op1 $op2 ">> $fich
            ;;
        D)
            if [ "$op2" -eq 0 ]; then
                echo "Error, tiene que ser mayor que cero"
                exit
            fi
            resul=$((op1 / op2))
            echo " $op1 / $op2 = $resul"
            echo "$op1 $op2" >> $fich
            ;;
        *)
            echo "Error, parámetros no válidos"
            exit
            ;;
    esac
	done

  echo "Contenido del archivo:"
	cat $fich
