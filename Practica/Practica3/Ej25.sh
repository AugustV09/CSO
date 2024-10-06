#!/bin/bash

retornarElemento() {
	if [ ${#arregloDeUsuarios[*]} -gt $1 ]
	then
		echo "El elemento en la posicion $1 es ${arregloDeUsuarios[${1}]}"	
		return 0
	fi

	echo "No existe elemento en la posicion $1"
	return 1
}
	
longitud() {
	echo "La longitud del arreglo de usuarios es de ${#arregloDeUsuarios[*]}"
	return 0
}

impresion() {
	echo "${arregloDeUsuarios[*]}"
	return 0
}

arregloDeUsuarios=()

usuarios=$(cat /etc/group | grep -w "users" | cut -d: -f4)
i=1
n=1
usuario=$(echo "$usuarios" | cut -d, -f${i})

while [ -n $usuario  ] && [ $n -ne 100  ] #No se que pasa pero se me queda en un bucle infinito
do
	arregloDeUsuarios+=("$usuario")
	i=$(($i + 1))
	n=$(($n + 1))
	usuario=$(echo "$usuarios" | cut -d, -f${i})
done

echo "${arregloDeUsuarios[*]}"

if [ $# -gt 0 ] && [ $# -lt 3 ]
then
	if [ $# -eq 2 ] && [ "$1" = "-b" ] && [ "$2" -ge 0 ] #La de que haya dos parametros esta bien o sobra??
	then
		retornarElemento $2
	elif [ "$1" = "-l"  ]
	then
		longitud
	elif [ "$1" = "-i" ]
		impresion
	else
		exit 1
	fi
fi
exit 0
