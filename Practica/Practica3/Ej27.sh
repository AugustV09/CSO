#!/bin/bash

inicializar() {
	array=()
}

agregar_elem() {
	if [ $# -ne 1 ]
	then
		return 1
	fi
	array+=("$1")
}

eliminar_elem() {
	
	if [ $# -ne 1 ] && [ ${#array[*]} -le $1 ]
	then
		echo "No se ha podido eliminar el elemento por tratarse de una posicion no valida"
		return 1
	fi
	unset array[${1}]
	array=(${array[*]}) #Cuando se hace esto, la posicion que quedó vacia no se copia al nuevo array.
	return 0
}

longitud() {
	echo ${#array[*]}
}

imprimir() {
	echo "${array[*]}"
}

inicializar_Con_Valores() {
	if [ $# -eq 2 ] && [ $1 -ge 0 ]
	then
		inicializar
		for ((i=0; i < ${1}; i++ ))
		do
			array+=("$2")	
		done
		return 0
	fi

	return 1
}

