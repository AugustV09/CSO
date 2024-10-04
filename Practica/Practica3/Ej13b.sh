#!/bin/bash

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
		"Salir")
			break
		;;
		*)
			exit 1
		;;
	esac
done

exit 0
