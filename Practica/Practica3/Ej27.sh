#!/bin/bash

inicializar() {
	array=()
	return 0
}

agregar_elem() {
	array+=("$1")
	return 0
}

eliminar_elem() {
	if [ ${#array[*]} -gt $1 ]
	then
		unset array[${1}]
		array=${array[*]} #Cuando se hace esto, la posicion que quedó vacia no se copia al nuevo array.
		return 0
	fi
	
	echo "No se ha podido eliminar el elemento por tratarse de una posicion no valida"
	return 1
}

longitud() {
	echo "La longitud del arreglo es ${#array[*]}."
	return 0
}

imprimir() {
	echo "${array[*]}"
	return 0
}

inicializar_Con_Valores() {
	if [ $1 -ge 0 ]
	then
		array=()
		for ((i=0; i < ${1}; i++ ))
		do
			array+=("$2")	
		done
		return 0
	fi

	return 1
}

