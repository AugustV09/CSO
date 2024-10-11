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

if [ $# -gt 0 ] && [ $# -lt 3 ]
then
	if [ $# -eq 2 ] && [ "$1" = "-b" ] && [ "$2" -ge 0 ] #La de que haya dos parametros esta bien o sobra??
	then
		retornarElemento $2
	elif [ "$1" = "-l"  ]
	then
		longitud
	elif [ "$1" = "-i" ]
	then
		impresion
	else
		exit 1
	fi
fi
exit 0
