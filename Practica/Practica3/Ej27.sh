#!/bin/bash

inicializar() {
	array=()
}

agregar_elem() {
	if [ $# -ne 1 ]
	then
		echo "Se esperaba 1 parametro." >&2
		return 1
	fi
	array+=("$1")
}

eliminar_elem() {
	
	if [ $# -ne 1 ]
	then
		echo "Se esperaba 1 parametro" >&2
		return 1
	fi

	if [ ${#array[*]} -le $1 ]
	then
		echo "No se ha podido eliminar el elemento por tratarse de una posicion no valida" >&2
		return 2
	fi

	unset array[${1}]
	array=(${array[*]}) #Cuando se hace esto, la posicion que quedó vacia no se copia al nuevo array.
}

longitud() {
	echo ${#array[*]}
}

imprimir() {
	echo "${array[*]}"
}

inicializar_Con_Valores() {
	if [ $# -ne 2 ]
	then
		echo "Se esperaban 2 parametros." >&2
		return 1
	fi

	if [ $1 -lt 0 ]
	then
		echo "El tamaño para el arreglo no es valido." >&2
		return 2
	fi

	inicializar
	for ((i=0; i < ${1}; i++ ))
	do
		array+=("$2")	
	done
}

