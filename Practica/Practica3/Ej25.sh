#!/bin/bash

retornarElemento() {
	if [ $# -ne 1 ]
	then
		echo "Se esperaba 1 parametro." >&2
		return 1
	fi
	
	if [ ${#arregloDeUsuarios[*]} -le $1 ]
	then
		echo "La posición seleccionada no es valida." >&2	
		return 2
	fi

	echo "El elemento en la posicion $1 es ${arregloDeUsuarios[${1}]}"
}
	
longitud() {
	echo ${#arregloDeUsuarios[*]}
}

impresion() {
	echo "${arregloDeUsuarios[*]}"
}

if [ $# -ge 3 ]
then
	echo "Se esperaban 2 parametros como maximo." >&2
	exit 1
fi

if [ $# -eq 1 ]
then
	if [ "$1" != "-l" ] || [ "$1" != "-i" ]
	then
		echo "Se esperaba como parametro -l o -i, pero llego $1." >&2
		exit 2
	fi
fi

if [ $# -eq 2 ] && [ "$1" != "-b" ]
then
	echo "Se esperaba como parametro -b seguido de un numero, pero llego $1 $2." >&2
	exit 3
fi

arregloDeUsuarios=()

usuarios=$(cat /etc/group | grep -w "users" | cut -d: -f4)
i=1
usuario=$(echo "$usuarios" | cut -d, -f${i})

anterior=""
#Debo usar la variable anterior porque el comando cut me devuelve siempre el mismo campo cuando no encuentra el separador (sin importar cual campo le indique). Por ende, la variable anterior cumple el rol de no repetir el mismo usuario y de no dejar que suceda un bucle infinito

while [ -n "$usuario" ] && [ "$usuario" != "$anterior" ] #No se que pasa pero se me queda en un bucle infinito
do
	arregloDeUsuarios+=("$usuario")
	let i++
	anterior=$usuario
	usuario=$(echo "$usuarios" | cut -d, -f${i})
done

if [ $# -gt 0 ]
then
	if [ "$1" = "-b" ]
	then
		retornarElemento $2
	elif [ "$1" = "-l"  ]
	then
		longitud	
	else
		impresion
	fi
fi
