#!/bin/bash

echo "Elige una opcion:"

select estado in Listar DondeEstoy QuienEsta Salir
do
	case $estado in
		"Listar")
			echo "$(ls)"
		;;
		"DondeEstoy")
			echo "$(pwd)"
		;;
		"QuienEsta")
			echo "$(who)"
		;;
		*)
			exit 1
		;;
	esac
	break #Este break es necesario porque el select es una estructura que funciona en bucle.
done

exit 0
