#!/bin/bash

echo "Por favor elige uno de los programas realizados:"

select eleccion in Ej12a.sh Ej12b.sh Ej12c.sh Ej13a.sh Ej13b.sh Ej13c.sh Ej14Absoluto.sh Ej16.sh Ej17.sh Ej18.sh Salir
do
	path=$(find / -type f -name "$eleccion" 2> /dev/null)

	case $eleccion in
		"Ej12a.sh")
			$(bash "$path") #Funciona pero que hago con los parametros????
		;;
		"Ej12b.sh")
			$(bash "$path") #Funciona pero que hago con los parametros????
		;;	
		"Ej12c.sh")
			$(bash "$path") #Funciona pero que hago con los parametros????
		;;	
		"Ej13a.sh")
			$(bash "$path") #Funciona pero que hago con los parametros????
		;;
		"Ej13b.sh")
			$(bash "$path") #Funciona pero que hago con los parametros????
		;;	
		"Ej13c.sh")
			$(bash "$path") #Funciona pero que hago con los parametros????
		;;	
		"Ej14Absoluto.sh")
			$(bash "$path") #Funciona pero que hago con los parametros????
		;;	
		"Ej16.sh")
			$(bash "$path") #Funciona pero que hago con los parametros????
		;;
		"Ej17.sh")
			$(bash "$path") #Funciona pero que hago con los parametros????
		;;	
		"Ej18.sh")
			$(bash "$path") #Funciona pero que hago con los parametros????
		;;		
		"Salir")
			exit 0 #El exit esta acá porque se imprimira el mensaje de elección una vez de más si estuviera fuera del select
		;;
		*)
			exit 1
		;;
	esac	
	echo "Por favor elige uno de los programas realizados:"
done
